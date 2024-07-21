resource "azurerm_virtual_network_peering" "example-01" {
  name                      = "peer1to2"
  resource_group_name       = var.azurerm_resource_group.example.name
  virtual_network_name      = azurerm_virtual_network.example-01.name
  remote_virtual_network_id = azurerm_virtual_network.example-02.id
}

resource "azurerm_virtual_network_peering" "example-02" {
  name                      = "peer2to1"
  resource_group_name       = var.azurerm_resource_group.example.name
  virtual_network_name      = azurerm_virtual_network.example-02.name
  remote_virtual_network_id = azurerm_virtual_network.example-01.id
}

locals {
  out_subnet_id = azurerm_virtual_network.example-01.subnet.*.id
}