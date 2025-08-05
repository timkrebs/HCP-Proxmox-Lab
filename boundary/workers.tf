# # Read README to understand why this file is commented out.

# provider kubernetes {} # Fill in your Kubernetes authentication details, or leave it like this and the defaults/current context

# provider boundary {
#   addr = var.boundary_cluster_url
#   auth_method_id = "ampw_abcd1234" # Known issue with the HCP provider, this value isn't computed by the hcp_boundary_cluster resource so it has to be filled in manually https://github.com/hashicorp/terraform-provider-hcp/issues/396
#   password_auth_method_login_name = "${var.cluster_name}-admin"
#   password_auth_method_password = module.hcp.admin_password
# }

# module workers {
#   source = "./workers"
#   organization_name = var.organization_name
#   project_name = var.project_name
#   catalog_name = var.catalog_name
#   node_names = var.node_names
#   cluster_name = var.cluster_name
#   public_host = var.public_host
#   starting_port = var.starting_port
#   worker_image = var.worker_image
#   storage_class_name = var.storage_class_name
#   volume_size = var.volume_size
#   boundary_cluster_url = module.hcp.cluster_url
# }