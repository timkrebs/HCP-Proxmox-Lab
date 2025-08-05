resource boundary_host_static host {
  for_each = var.targets
  name = each.key
  description = each.key
  address = each.value
  host_catalog_id = var.catalog_id
}

resource boundary_host_set_static host {
  for_each = var.targets
  name = each.key
  description = each.key
  host_catalog_id = var.catalog_id
  host_ids = [ boundary_host_static.host[each.key].id ]
}

resource boundary_target host {
  for_each = var.targets
  type = "tcp"
  name = each.key
  description = each.key
  scope_id = var.scope_id
  session_connection_limit = 1
  default_port = var.port
  host_source_ids = [
    boundary_host_set_static.host[each.key].id
  ]
  worker_filter = "\"homelab\" in \"/tags/type\""
}