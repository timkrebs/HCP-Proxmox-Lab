resource kubernetes_namespace_v1 boundary {
  metadata {
    name = "boundary"
    labels = {
      name = "boundary"
    }
  }
}

resource kubernetes_secret_v1 controller_tokens {
  metadata {
    name = "controller-tokens"
    namespace = kubernetes_namespace_v1.boundary.metadata[0].name
  }
  data = {
    for n in var.node_names : "hcp-boundary-worker-${n}" => boundary_worker.homelab_worker[n].controller_generated_activation_token
  }
  lifecycle {
    ignore_changes = [
      data
    ]
  }
}

resource kubernetes_config_map_v1 worker_config {
  metadata {
    name = "hcp-boundary-worker-config"
    namespace = kubernetes_namespace_v1.boundary.metadata[0].name
  }
  data = {
    for i, v in var.node_names : "hcp-boundary-worker-${v}.hcl" => templatefile(
      "${path.module}/files/pki-worker.hcl.tftpl",
      {
        cluster_id = local.cluster_id,
        public_addr = "${var.public_host}:${var.starting_port + i}",
        worker_name = "hcp-boundary-worker-${v}",
        host_name = v,
        activation_token = kubernetes_secret_v1.controller_tokens.data["hcp-boundary-worker-${v}"]
      })
  }
}

resource kubernetes_stateful_set_v1 hcp_boundary_workers {
  for_each = toset(var.node_names)
  metadata {
    name = "hcp-boundary-worker-${each.key}"
    namespace = kubernetes_namespace_v1.boundary.metadata[0].name
    labels = {
      app = "hcp-boundary-worker-${each.key}"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "hcp-boundary-worker-${each.key}"
      }
    }
    service_name = "hcp-boundary-${each.key}"
    template {
      metadata {
        labels = {
          app = "hcp-boundary-worker-${each.key}"
        }
        annotations = {
          config-checksum = sha256(kubernetes_config_map_v1.worker_config.data["hcp-boundary-worker-${each.key}.hcl"])
        }
      }
      spec {
        node_selector = {
          "kubernetes.io/hostname" = "${each.key}"
        }
        container {
          image = var.worker_image
          name  = "worker"
          command = [
            "boundary-worker",
            "server",
            "-config",
            "/boundary/hcp-boundary-worker-${each.key}.hcl"
          ]
          port {
            name = "data"
            container_port = 9202
          }
          volume_mount {
            mount_path = "/boundary"
            name = "hcp-boundary-worker-config"
            read_only = true
          }
          volume_mount {
            mount_path = "/worker"
            name = "data"
          }
        }
        volume {
          name = "hcp-boundary-worker-config"
          config_map {
            name = kubernetes_config_map_v1.worker_config.metadata[0].name
          }
        }
      }
    }
    volume_claim_template {
      metadata {
        name = "data"
      }
      spec {
        access_modes       = ["ReadWriteOnce"]
        storage_class_name = var.storage_class_name
        resources {
          requests = {
            storage = var.volume_size
          }
        }
      }
    }
  }
}

resource kubernetes_service_v1 hcp_boundary_workers {
  for_each = { for i, v in var.node_names : v => i }
  metadata {
    name = "hcp-boundary-worker-${each.key}"
    namespace = kubernetes_namespace_v1.boundary.metadata[0].name
    labels = {
      app = "hcp-boundary-worker-${each.key}"
    }
  }
  spec {
    type = "LoadBalancer"
    port {
      port = 9202 + each.value * 10
      target_port = "data"
      name = "data"
    }
    selector = {
      app = "hcp-boundary-worker-${each.key}"
    }
  }
  wait_for_load_balancer = false
}