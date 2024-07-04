resource "azurerm_subnet_network_security_group_association" "private_subnet_nsg_association" {
  subnet_id                 = var.subnet_ids.private_subnet_id
  network_security_group_id = var.nsg_ids[0]
}

resource "azurerm_subnet_network_security_group_association" "public_subnet_nsg_association" {
  subnet_id                 = var.subnet_ids.public_subnet_id
  network_security_group_id = var.nsg_ids[1]
}

resource "azurerm_subnet_network_security_group_association" "jumpbox_subnet_nsg_association" {
  subnet_id                 = var.subnet_ids.jumpbox_subnet_id
  network_security_group_id = var.nsg_ids[2]
}