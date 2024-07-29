output "public_ip_id" {
  value = azurerm_public_ip.vmss.id
}

output "public_ip_jumpbox_id" {
  value = azurerm_public_ip.jumpbox.id
}