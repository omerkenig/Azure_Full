resource "azurerm_lb_probe" "example" {
  loadbalancer_id = azurerm_lb.example.id
  name            = var.azurerm_lb_probe.name
  protocol        = var.azurerm_lb_probe.protocol
  request_path    = var.azurerm_lb_probe.request_path
  port            = var.azurerm_lb_probe.port
}
