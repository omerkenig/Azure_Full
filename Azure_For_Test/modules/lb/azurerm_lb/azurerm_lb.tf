
resource "azurerm_lb" "vmss" {
  name                = var.lb_rg_name
  location            = var.location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = var.public_ip_id
  }

  tags = var.tags
}