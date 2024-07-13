
module "azurerm_resource_group" {
  source = "../modules/azurerm_resource_group"
}

module "azurerm_virtual_machine_scale_set" {
  source = "../modules/azurerm_virtual_machine_scale_set"

  azurerm_lb_probe    = ""
  azurerm_subnet      = ""
  resource_group_name = ""
}

module "lb" {
  source = "../modules/lb"

  address_space                        = ""
  allocation_method                    = ""
  azurerm_lb_backend_address_pool_name = ""
  azurerm_lb_name                      = ""
  azurerm_lb_nat_pool_name             = ""
  azurerm_lb_probe                     = ""
  azurerm_public_ip                    = var.azurerm_public_ip
  backend_port                         = ""
  frontend_ip_configuration_name       = ""
  frontend_port_end                    = ""
  frontend_port_start                  = ""
  location                             = ""
  protocol                             = ""
  resource_group_name                  = var.resource_group_name
  subnet_address_ranges                = ""
  subnet_names                         = ""
  virtual_network_name                 = ""
}

module "network" {
  source                = "../modules/network"

  address_space                        = ""
  allocation_method                    = ""
  azurerm_lb_backend_address_pool_name = ""
  azurerm_lb_name                      = ""
  frontend_ip_configuration_name       = ""
  location                             = ""
  resource_group_name                  = ""
  subnet_address_ranges                = ""
  subnet_names                         = ""
  virtual_network_name                 = ""
}
