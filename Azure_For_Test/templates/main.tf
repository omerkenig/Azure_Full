module "rg" {
  source = "../modules/rg/"
}

module "vnet" {
  source  = "../modules/net/vnet"
  rg_name = module.rg.rg_name
  depends_on = [module.rg]
}

module "subnet" {
  source = "../modules/net/subnet"

  rg_name   = module.rg.rg_name
  vnet_name = module.vnet
  depends_on = [module.rg, module.vnet]

}

module "azurerm_public_ip" {
  source             = "../modules/net/public_ip"
  random_string_fqdn = module.rg.random_string_fqdn
  rg_name            = module.rg.rg_name
  depends_on = [module.rg]

}

module "azurerm_lb" {
  source       = "../modules/lb/azurerm_lb"
  location     = module.rg.rg_location
  public_ip_id = module.azurerm_public_ip.public_ip_id
  rg_name      = module.rg.rg_name

  depends_on = [module.rg, module.azurerm_public_ip]
}

module "address_pool" {
  source       = "../modules/lb/address_pool"
    lb_name = module.azurerm_lb.lb_name

  depends_on = [ module.azurerm_lb]

}

# module "lb_probe" {
#   source  = "../modules/lb/lb_probe"
#   lb_name = module.azurerm_lb.lb_name
#   rg_name = module.rg.rg_name
#   depends_on = [module.rg, module.azurerm_lb]
#
# }
# module "address_pool" {
#   source  = "../modules/lb/address_pool"
#   lb_name = module.azurerm_public_ip.lb_name
#   depends_on = [module.azurerm_public_ip]
#
# }
#
# module "lb_probe" {
#   source  = "../modules/lb/lb_probe"
#   lb_name = module.azurerm_public_ip.lb_name
#   rg_name = module.rg.rg_name
#   depends_on = [module.rg, module.lb]
#
# }
#
# module "lb_rule" {
#   source                     = "../modules/lb/lb_rule"
#   lb_backend_address_pool_id = module.address_pool.lb_backend_address_pool_id
#   lb_id                      = module.azurerm_public_ip.lb_id
#   lb_name                    = module.azurerm_public_ip.lb_name
#   lb_probe_id                = module.lb_probe.lb_probe_id
#   rg_name                    = module.rg.rg_name
#   depends_on = [module.rg, module.lb_probe, module.azurerm_public_ip]
#
# }
#
# module "nic" {
#   source = "../modules/net/nic"
#   public_ip_jumpbox_id = module.public_ip.public_ip_jumpbox_id
#   rg_name = module.rg.rg_name
#   subnet_id = module.subnet
#
#   depends_on = [module.rg, module.public_ip, module.subnet]
#
# }
#
# module "vmss" {
#   source = "../modules/vm/vmss"
#   lb_backend_address_pool_id = module.address_pool.lb_backend_address_pool_id
#   rg_name = module.rg.rg_name
#   subnet_id = module.subnet.subnet_id
#   depends_on = [module.rg, module.address_pool, module.subnet]
#
# }
#
#
# module "vm" {
#   source = "../modules/vm/vm"
#   nic_id = module.nic.nic_id
#   rg_name = module.rg.rg_name
#
#   depends_on = [module.rg, module.nic]
#
# }