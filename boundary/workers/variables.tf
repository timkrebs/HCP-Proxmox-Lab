variable organization_name {
  type = string
}

variable project_name {
  type = string
}

variable catalog_name {
  type = string
}

variable node_names {
  type = list(string)
}

variable cluster_name {
  type = string
}

variable public_host {
  type = string
}

variable starting_port {
  type = number
  default = 9992
}

variable worker_image {
  type = string
  default = "hashicorp/boundary-worker-hcp:0.11.2-hcp"
}

variable storage_class_name {
  type = string
  default = "local-path"
}

variable volume_size {
  type = string
  default = "128Mi"
}

variable boundary_cluster_url {
  type = string
}