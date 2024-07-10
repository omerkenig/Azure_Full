resource "azurerm_network_security_rule" "public_subnet_rule_1" {
  count                   = length(var.allow_inbound_ports)
  name                    = "inbound-rule-${var.allow_inbound_ports[count.index]}"
  priority                = count.index*10 + 100
  direction               = "Inbound"
  access                  = "Allow"
  protocol                = "Tcp"
  source_port_range       = "*"
  destination_port_range  = var.allow_inbound_ports[count.index]
  source_address_prefix   = "*"
  destination_address_prefix = "*"
  resource_group_name     = azurerm_network_security_group.nsg_public_subnet.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg_public_subnet.name
}

resource "azurerm_network_security_rule" "jumpbox_subnet_rule_1" {
  count                   = length(var.allow_inbound_ports)
  name                    = "inbound-rule-${var.allow_inbound_ports[count.index]}"
  priority                = count.index*10 + 100
  direction               = "Inbound"
  access                  = "Allow"
  protocol                = "Tcp"
  source_port_range       = "*"
  destination_port_range  = var.allow_inbound_ports[count.index]
  source_address_prefix   = "*"
  destination_address_prefix = "*"
  resource_group_name     = azurerm_network_security_group.nsg_jumpbox_subnet.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg_jumpbox_subnet.name
}