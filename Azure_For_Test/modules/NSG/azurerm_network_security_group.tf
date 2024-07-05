resource "azurerm_network_security_group" "nsg_public_subnet" {
  name                = "nsg-${var.subnet_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
}
resource "azurerm_network_security_group" "nsg_private_subnet" {
  name                = "nsg-${var.subnet_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
}
resource "azurerm_network_security_group" "nsg_jumpbox_subnet" {
  name                = "nsg-${var.subnet_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
}