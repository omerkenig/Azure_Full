

//added module for virtual network
module "Omer_vnet" {
  source                = "./modules/network/"
  resource_group_name   = var.resource_group_name
  location              = var.location
  address_space         = var.vnet_address_space
  subnet_names          = var.subnet_names
  subnet_address_ranges = var.subnet_address_ranges
  virtual_network_name  = var.virtual_network_name
}
module "nsg_public_subnet" {
  source              = "./modules/NSG/"
  resource_group_name = var.resource_group_name
  subnet_name         = var.subnet_names[1]
  allow_inbound_ports = var.public_subnet_nsg_allow_ports
  location            = var.location
}

module "nsg_jumpbox_subnet" {
  source              = "./modules/nsg"
  resource_group_name = var.resource_group_name
  subnet_name         = var.subnet_names[2]
  allow_inbound_ports = var.jumpbox_subnet_nsg_allow_ports
  location            = var.location
}

module "nsg_private_subnet" {
  source              = "./modules/nsg"
  resource_group_name = var.resource_group_name
  subnet_name         = var.subnet_names[0]
  allow_inbound_ports = []  # No custom rules for the private subnet
  location            = var.location
}

module "nsg_associations" {
  source     = "./modules/nsg_associations"
  subnet_ids = module.Omer_vnet.subnet_ids
  nsg_ids = [
    module.nsg_private_subnet.private_nsg_id, module.nsg_public_subnet.public_nsg_id,
    module.nsg_jumpbox_subnet.jumpbox_nsg_id
  ]
}

module "vm" {
  source              = "./modules/vm"
  vm_name             = "Test-vm"
  nic_name            = "Test-nic"
  location            = var.location
  vm_size             = "Standard_D2s_v3"
  resource_group_name = var.resource_group_name
  subnet_id           = module.Omer_vnet.subnet_ids.private_subnet_id
  priority            = "spot"


}