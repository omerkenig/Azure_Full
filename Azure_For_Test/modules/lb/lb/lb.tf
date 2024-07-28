resource "azurerm_lb" "vmss" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                 = var.frontend_ip
    public_ip_address_id = var.public_ip
  }

  tags = var.tags
}