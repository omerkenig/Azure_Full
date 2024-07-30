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
