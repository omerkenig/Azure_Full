//added module for virtual network
module "Test_vnet" {
  source                                       = "../modules/network/"
  resource_group_name                          = var.resource_group_name
  location                                     = var.location
  address_space                                = var.address_space
  subnet_names                                 = var.subnet_names
  subnet_address_ranges                        = var.subnet_address_ranges
  virtual_network_name                         = var.virtual_network_name
  address_prefixes                             = var.address_prefixes
  admin_username                               = var.admin_username
  azurerm_linux_virtual_machine_scale_set_name = var.azurerm_linux_virtual_machine_scale_set_name
  azurerm_resource_group                       = var.azurerm_resource_group
  azurerm_subnet                               = var.azurerm_subnet
  azurerm_virtual_network                      = var.azurerm_virtual_network
  instances                                    = var.instances
  name                                         = var.name
  sku_size                                     = var.sku_size
  tags                                         = var.tags
  username                                     = var.username
}
module "Test_RG" {
  source                 = "../modules/azurerm_resource_group/"
  azurerm_resource_group = "test_RG"
  location               = "west Europe"
}


