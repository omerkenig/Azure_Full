output "private_nsg_id" {
  value = azurerm_network_security_group.nsg_private_subnet.id
}

output "public_nsg_id" {
  value = azurerm_network_security_group.nsg_public_subnet.id
}

output "jumpbox_nsg_id" {
  value = azurerm_network_security_group.nsg_jumpbox_subnet.id
}