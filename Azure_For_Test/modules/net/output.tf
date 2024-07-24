output "vmss_public_ip_fqdn" {
   value = azurerm_public_ip.vmss.fqdn
}

output "azurerm_public_ip" {
   value = azurerm_public_ip.vmss.ip_address
}

output "subnet_id" {
   value = azurerm_subnet.vmss.id
}