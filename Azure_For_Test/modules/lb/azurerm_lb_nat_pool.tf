resource "azurerm_lb_nat_pool" "lbnatpool" {
  resource_group_name            = var.resource_group_name.example.name
  name                           = var.azurerm_lb_nat_pool_name.example.name
  loadbalancer_id                = azurerm_lb.example.id
  protocol                       = var.protocol
  frontend_port_start            = var.frontend_port_start
  frontend_port_end              = var.frontend_port_end
  backend_port                   = var.backend_port
  frontend_ip_configuration_name = var.frontend_ip_configuration_name.example
}