output "public_ip_id" {
  value = azurerm_public_ip.vmss.id
}
output "random_string_fqdn" {
  value = random_string.fqdn.result
}
output "public_ip_jumpbox_id" {
  value = azurerm_public_ip.jumpbox.id
}