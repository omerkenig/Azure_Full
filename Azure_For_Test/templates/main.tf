module "azurerm_resource_group" {
  source                      = "../modules/azurerm_resource_group/"
  location                    = var.location
  tags                        = var.tags
  azurerm_resource_group_name = var.azurerm_resource_group_name
}

module "lb" {
  source                             = "../modules/lb/"
  application_port                   = var.application_port
  location                           = var.location
  tags                               = var.tags
  name                               = var.name
  azurerm_public_ip                  = var.azurerm_public_ip
  resource_group_name                = var.resource_group_name
  azurerm_resource_group             = var.resource_group_name
  azurerm_lb_backend_address_pool_id = var.azurerm_lb_backend_address_pool_id
}

module "network" {
  source              = "../modules/net/"
  location            = var.location
  tags                = var.tags
  resource_group_name = var.resource_group_name
  name                = var.name
  subnet_name         = var.subnet_name
  subnet_id           = var.subnet_id
}

module "vmss" {
  source = "../modules/vmss/"

  admin_password      = var.admin_password
  admin_user          = var.admin_user
  location            = var.location
  tags                = var.tags
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
#   azurerm_lb_backend_address_pool_id = var.azurerm_lb_backend_address_pool_id
}