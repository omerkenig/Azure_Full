output "resource_group_name" {
  value = module.azurerm_resource_group.resource_group_name
}

output "location" {
  value = module.azurerm_resource_group.location
}

output "subnet_id" {
  value = module.net.subnet_id
}

output "pip_id" {
  value = module.net.pip_id
}

output "vpn_gw_pip_id" {
  value = module.net.vpn_gw_pip_id
}

output "nsg_id" {
  value = module.net.nsg_id
}

output "vm_id" {
  value = module.vm.vm_id
}
