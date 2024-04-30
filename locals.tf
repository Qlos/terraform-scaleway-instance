locals {
  server_name        = var.server_name != null ? var.server_name : local.requested_fqdn
  requested_fqdn     = (var.hostname != null && var.domainname != null) ? format("%s.%s", var.hostname, var.domainname) : var.hostname
  effective_hostname = var.domainname != null ? trimsuffix(trimsuffix(scaleway_instance_server.this.name, var.domainname), ".") : scaleway_instance_server.this.name
  effective_fqdn     = var.domainname != null ? format("%s.%s", local.effective_hostname, var.domainname) : local.effective_hostname
}
