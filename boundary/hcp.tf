terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
    }
  }
}

module hcp {
  source = "./hcp"
  project_name = var.project_name
  cluster_name = var.cluster_name
  service-principal-key-client-id = var.service-principal-key-client-id
  service-principal-key-client-secret = var.service-principal-key-client-secret
  admin_password = var.admin_password
}