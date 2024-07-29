module "azurerm_resource_group" {
  source                      = "../modules/rg/"
  azurerm_resource_group_name = var.azurerm_resource_group_name
  location                    = var.location
  tags                        = var.tags
}

module "lb" {
  source                                  = "../modules/lb"




}

module "network" {
  source              = "../modules/net/"
  location            = var.location
  tags                = var.tags
  resource_group_name = var.resource_group_name
  name                = var.name
  subnet_name         = var.subnet_name
  address_prefixes    = var.address_prefixes
  subnet_id           = var.subnet_id
}

module "vmss" {
  source = "../modules/vm/"

  admin_password      = var.admin_password
  admin_user          = var.admin_user
  location            = var.location
  tags                = var.tags
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  #   azurerm_lb_backend_address_pool_id = var.azurerm_lb_backend_address_pool_id
}