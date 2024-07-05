output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "pip_id" {
  value = azurerm_public_ip.pip.id
}

output "vpn_gw_pip_id" {
  value = azurerm_public_ip.vpn_gw_pip.id
}

output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}
