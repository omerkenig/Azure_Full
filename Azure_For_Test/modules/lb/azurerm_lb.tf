resource "azurerm_lb" "example" {
  name                = var.azurerm_lb_name
  location            = var.resource_group_name.location
  resource_group_name = var.resource_group_name.name

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = var.azurerm_public_ip.example.id
  }
}