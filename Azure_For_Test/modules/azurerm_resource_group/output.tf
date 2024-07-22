output "resource_group_name" {
  value = azurerm_resource_group.vmss.name
}

output "location" {
  value = azurerm_resource_group.vmss.location
}
