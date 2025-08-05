terraform {
  required_providers {
    boundary = {
      source = "hashicorp/boundary"
      version = "1.1.3"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.14.0"
    }
  }
}