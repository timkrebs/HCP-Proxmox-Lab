terraform {
  required_providers {
    hcp = {
      source = "hashicorp/hcp"
      version = "~> 0.106.0"
    }
    random = {
      source = "hashicorp/random"
      version = "~> 3.5.1"
    }
  }
}