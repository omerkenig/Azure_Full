resource "azurerm_lb_rule" "lbnatrule" {
  resource_group_name            = var.rg_name
  loadbalancer_id                = var.lb_id
  name                           = var.lb_rule_name
  protocol                       = var.protocol
  frontend_port                  = var.application_port
  backend_port                   = var.application_port
  backend_address_pool_ids = [var.lb_backend_address_pool_id]
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
  probe_id                       = var.lb_probe_id
}