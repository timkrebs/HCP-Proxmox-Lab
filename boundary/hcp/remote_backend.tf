terraform {
  required_providers {
    hcp = {
      source = "hashicorp/hcp"
      version = "~> 0.80.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.1.0"
    }
  }
}