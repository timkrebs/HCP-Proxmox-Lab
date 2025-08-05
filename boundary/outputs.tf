output admin_password {
  sensitive = true
  value = random_string.hcp_boundary_admin_password.result
}

output cluster_url {
  value = hcp_boundary_cluster.cluster.cluster_url
}