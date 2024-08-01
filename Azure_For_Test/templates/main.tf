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

  rg_name          = module.rg.rg_name
  vnet_name_output = module.vnet.vnet_name_output
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

module "azurerm_lb_backend_address_pool" {
  source = "../modules/lb/azurerm_lb_backend_address_pool"
  lb_id  = module.azurerm_lb.lb_id
  depends_on = [module.azurerm_lb]

}

module "lb_probe" {
  source  = "../modules/lb/lb_probe"
  lb_id   = module.azurerm_lb.lb_id
  rg_name = module.rg.rg_name
  depends_on = [module.rg, module.azurerm_lb]

}

module "lb_rule" {
  source                     = "../modules/lb/lb_rule"
  lb_backend_address_pool_id = module.azurerm_lb_backend_address_pool.lb_backend_address_pool_id
  lb_id                      = module.azurerm_lb.lb_id
  lb_name                    = module.azurerm_lb.lb_name_output
  lb_probe_id                = module.lb_probe.lb_probe_id
  rg_name                    = module.rg.rg_name
  depends_on = [module.rg, module.lb_probe, module.azurerm_lb, module.azurerm_lb_backend_address_pool]

}

module "vmss" {
  source = "../modules/vm/vmss"
  lb_backend_address_pool_id = module.azurerm_lb_backend_address_pool.lb_backend_address_pool_id
  rg_name                    = module.rg.rg_name
  subnet_id                  = module.subnet.subnet_id_output
  depends_on = [module.rg, module.azurerm_lb_backend_address_pool, module.subnet]
}

module "public_ip_jumpbox" {
  source = "../modules/net/public_ip_jumpbox"
  random_string_fqdn = module.rg.random_string_fqdn
  rg_name            = module.rg.rg_name
  subnet_id_output   = module.subnet.subnet_id_output

  depends_on = [module.rg, module.subnet]
}

module "nic" {
  source               = "../modules/net/nic"
  public_ip_jumpbox_id = module.azurerm_public_ip.public_ip_id
  rg_name              = module.rg.rg_name
  subnet_id_output     = module.subnet.subnet_id_output
  depends_on = [module.rg, module.subnet, module.azurerm_public_ip]

}

module "vm" {
  source  = "../modules/vm/vm"
  nic_id  = module.nic.nic_id
  rg_name = module.rg.rg_name

  depends_on = [module.rg, module.nic]

}