provider hcp {}

module hcp {
  source = "./hcp"
  cluster_name = var.cluster_name
  project_name = var.project_name
}