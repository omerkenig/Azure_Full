resource "azurerm_subnet" "vmss" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vmss.name
  address_prefixes = ["10.0.2.0/24"]
}