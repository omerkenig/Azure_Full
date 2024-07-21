resource "azurerm_network_security_group" "example" {
  name                = "example-security-group"
  location            = var.azurerm_resource_group.example.location
  resource_group_name = var.azurerm_resource_group.example.name
}