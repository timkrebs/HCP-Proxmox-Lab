resource "random_string" "hcp_boundary_admin_password" {
  length  = 32
  special = true
  upper   = true
  lower   = true
  number  = true
}

resource hcp_boundary_cluster "cluster" {
  cluster_id = var.cluster_name
  username = "${var.cluster_name}-admin"
  password = var.admin_password
  tier = "Standard"
}