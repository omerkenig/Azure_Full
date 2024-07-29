resource "lb_probe" "vmss" {
  resource_group_name = var.rg_name
  loadbalancer_id     = var.lb_name
  name                = var.lb_probe_name
  port                = var.application_port
}