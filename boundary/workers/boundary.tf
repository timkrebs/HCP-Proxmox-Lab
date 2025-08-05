resource boundary_scope organization {
  name = var.organization_name
  description = "My scope"
  scope_id = "global"
  auto_create_admin_role = true
  auto_create_default_role = true
}

resource boundary_scope project {
  name = var.project_name
  description = "My project"
  scope_id = boundary_scope.organization.id
  auto_create_admin_role = true
  auto_create_default_role = true
}

resource boundary_host_catalog_static catalog {
  name = var.catalog_name
  description = "My catalog"
  scope_id = boundary_scope.project.id
}

resource boundary_worker worker {
  for_each = toset(var.node_names)
  scope_id = "global"
  name = "hcp-boundary-worker-${each.key}"
}

module targets_ssh {
  source = "./modules/boundary-targets"
  catalog_id = boundary_host_catalog_static.catalog.id
  scope_id = boundary_scope.project.id
  port = 22
  targets = {
    host1 = "10.10.0.1"
    host2 = "10.10.0.2"
    host3 = "10.10.0.3"
    host4 = "10.10.0.4"
    host5 = "10.10.0.5"
  }
}