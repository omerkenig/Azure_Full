resource "azurerm_lb_probe" "vmss" {
  loadbalancer_id     = var.lb_id
  name                = var.lb_probe_name
  port                = var.application_port
}