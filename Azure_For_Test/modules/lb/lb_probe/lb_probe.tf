resource "azurerm_lb_probe" "vmss" {
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.vmss.id
  name                = "ssh-running-probe"
  port                = var.application_port
}