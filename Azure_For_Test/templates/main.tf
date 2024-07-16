resource "azurerm_resource_group" "example" {
  name = var.name
  location = var.location
}

# resource "azurerm_network_security_group" "example" {
#   name                = "example-security-group"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
# }


resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.10.0.0/16"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.10.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.10.2.0/24"
#     security_group = azurerm_network_security_group.example.id
  }

  tags = {
    environment = "Test environment"
  }
}

resource "azurerm_virtual_network" "example-1" {
  name                = "example-network"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.11.0.0/16"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.11.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.11.2.0/24"
#     security_group = azurerm_network_security_group.example.id
  }

  tags = {
    environment = "Test environment"
  }
}

resource "azurerm_virtual_network_peering" "example-1" {
  name                      = "peer1to2"
  resource_group_name       = azurerm_resource_group.example.name
  virtual_network_name      = azurerm_virtual_network.example.name
  remote_virtual_network_id = azurerm_virtual_network.example.id
}

resource "azurerm_virtual_network_peering" "example-2" {
  name                      = "peer2to1"
  resource_group_name       = azurerm_resource_group.example.name
  virtual_network_name      = azurerm_virtual_network.example.name
  remote_virtual_network_id = azurerm_virtual_network.example.id
}