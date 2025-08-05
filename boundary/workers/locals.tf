locals {
  cluster_id = trimsuffix(trimprefix(var.boundary_cluster_url, "https://"), ".boundary.hashicorp.cloud")
}