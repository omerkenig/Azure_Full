module "vm_and_vpn" {
  source              = "./modules/"
  resource_group_name = "my-resource-group"
  location            = "eastus"
  prefix              = "OmerProject"
  admin_username      = "adminuser"
  vm_size             = ""
}

