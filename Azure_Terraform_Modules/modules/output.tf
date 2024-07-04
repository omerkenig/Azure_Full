output "vm_public_ip" {
  value = azurerm_public_ip.vm_public_ip.ip_address
}

output "vpn_gateway_public_ip" {
  value = azurerm_public_ip.vpn_public_ip.ip_address
}