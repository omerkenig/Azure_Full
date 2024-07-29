output "rg_id" {
  value = azurerm_resource_group.vmss.id
}

output "rg_name" {
  value = azurerm_resource_group.vmss.name
}

output "random_string_fqdn" {
  value = random_string.fqdn.result
}