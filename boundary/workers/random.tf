resource random_string hcp_boundary_admin_password {
  length = 50
  lifecycle {
    prevent_destroy = true
  }
}