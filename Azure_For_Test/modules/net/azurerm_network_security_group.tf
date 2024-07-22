resource "azurerm_network_security_group" "example" {
  name                = "example-security-group"
  location            = var.resource_group_name.example.location
  resource_group_name = var.resource_group_name.example.name
}