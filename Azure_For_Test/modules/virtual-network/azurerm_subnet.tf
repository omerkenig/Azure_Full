resource "azurerm_subnet" "subnet" {
    name                    = var.subnet_name
    resource_group_name     = var.resource_group_name
    virtual_network_name    = azurerm_virtual_network.vnet.name
#     address_prefix          = var.subnet_address_prefix
  address_prefixes = var.subnet_address_prefix
}