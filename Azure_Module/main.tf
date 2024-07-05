module "azurerm_resource_group" {
  source   = "./modules/azurerm_resource_group"
  name     = var.resource_group_name
  location = var.location
}

module "net" {
  source              = "./modules/net"
  vnet_name           = var.vnet_name
  vnet_address_space  = var.vnet_address_space
  subnet_name         = var.subnet_name
  subnet_address_prefix = var.subnet_address_prefix
  pip_name            = var.pip_name
  vpn_gw_pip_name     = var.vpn_gw_pip_name
  nsg_name            = var.nsg_name
  location            = module.azurerm_resource_group.location
  resource_group_name = module.azurerm_resource_group.resource_group_name
}

resource "azurerm_virtual_network_gateway" "vpn_gateway" {
  name                = var.vpn_gw_name
  location            = module.azurerm_resource_group.location
  resource_group_name = module.azurerm_resource_group.resource_group_name
  type                = "Vpn"
  vpn_type            = "RouteBased"
  sku                 = "VpnGw1"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = module.net.vpn_gw_pip_id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = module.net.subnet_id
  }

  depends_on = [module.net]
}

module "vm" {
  source              = "./modules/vm"
  nic_name            = var.nic_name
  location            = module.azurerm_resource_group.location
  resource_group_name = module.azurerm_resource_group.resource_group_name
  subnet_id           = module.net.subnet_id
  pip_id              = module.net.pip_id
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}
