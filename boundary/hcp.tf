terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "~> 0.106.0"
    }
  }
}

provider "hcp" {
  client_id     = var.service-principal-key-client-id
  client_secret = var.service-principal-key-client-secret

}

module hcp {
  source = "./hcp"
  cluster_name = var.cluster_name
}