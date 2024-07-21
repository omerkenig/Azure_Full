module "vm" {
  source                    = "../modules/vm"
  azurerm_resource_group    = ""
  size                      = ""
  username                  = ""
  azurerm_network_interface = ""
}
# resource "azurerm_resource_group" "example" {
#   name     = "example-resources"
#   location = "west Europe"
# }
#
# resource "azurerm_network_security_group" "example" {
#   name                = "example-security-group"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
# }

# resource "azurerm_virtual_network" "example-01" {
#   name                = "example-network-01"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
#   address_space       = ["10.10.0.0/16"]
#   subnet {
#     name           = "subnet1"
#     address_prefix = "10.10.1.0/24"
#   }
#
#   subnet {
#     name           = "subnet2"
#     address_prefix = "10.10.2.0/24"
# #     security_group = azurerm_network_security_group.example.id
#   }
#
#   tags = {
#     environment = "Test environment"
#   }
# }
#
# resource "azurerm_virtual_network" "example-02" {
#   name                = "example-network-02"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
#   address_space       = ["10.11.0.0/16"]
#   subnet {
#     name           = "subnet1"
#     address_prefix = "10.11.1.0/24"
#   }
#
#   subnet {
#     name           = "subnet2"
#     address_prefix = "10.11.2.0/24"
# #     security_group = azurerm_network_security_group.example.id
#   }
#
#   tags = {
#     environment = "Test environment-02"
#   }
# }
#
# resource "azurerm_virtual_network_peering" "example-01" {
#   name                      = "peer1to2"
#   resource_group_name       = azurerm_resource_group.example.name
#   virtual_network_name      = azurerm_virtual_network.example-01.name
#   remote_virtual_network_id = azurerm_virtual_network.example-02.id
# }
#
# resource "azurerm_virtual_network_peering" "example-02" {
#   name                      = "peer2to1"
#   resource_group_name       = azurerm_resource_group.example.name
#   virtual_network_name      = azurerm_virtual_network.example-02.name
#   remote_virtual_network_id = azurerm_virtual_network.example-01.id
# }
#
# locals {
#   out_subnet_id =azurerm_virtual_network.example-01.subnet.*.id
# }

# resource "azurerm_network_interface" "example" {
#   name                = "example-nic"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
#
#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = local.out_subnet_id[0]
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_linux_virtual_machine" "example" {
#   name                = "example-machine"
#   resource_group_name = azurerm_resource_group.example.name
#   location            = azurerm_resource_group.example.location
#   size                = "Standard_D2s_v5"
#   admin_username      = "adminuser"
#   network_interface_ids = [
#     azurerm_network_interface.example.id,
#   ]
#
#   admin_ssh_key {
#     username   = "adminuser"
#     public_key = file("~/.ssh/id_rsa.pub")
#   }
#
#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }
#
#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts"
#     version   = "latest"
#   }
# }
