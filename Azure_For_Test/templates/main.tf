
module "azurerm_resource_group" {
  source = "../modules/azurerm_resource_group/"

  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}



module "lb" {
  source = "../modules/lb/"
  application_port = var.application_port
  location = var.location
  tags = var.tags
  name = var.name
  azurerm_public_ip = var.azurerm_public_ip
  resource_group_name = var.resource_group_name
  azurerm_resource_group = var.resource_group_name
}

module "netwotk" {
  source = "../modules/net/"
  location = var.location
  tags = var.tags
  resource_group_name = var.resource_group_name
}

# resource "azurerm_resource_group" "vmss" {
#   name     = var.resource_group_name
#   location = var.location
#   tags     = var.tags
# }
#
# resource "random_string" "fqdn" {
#   length  = 6
#   special = false
#   upper   = false
#   numeric = false
# }
#
# resource "azurerm_virtual_network" "vmss" {
#   name                = "vmss-vnet"
#   address_space       = ["10.0.0.0/16"]
#   location            = var.location
#   resource_group_name = azurerm_resource_group.vmss.name
#   tags                = var.tags
# }
#
# resource "azurerm_subnet" "vmss" {
#   name                 = "vmss-subnet"
#   resource_group_name  = azurerm_resource_group.vmss.name
#   virtual_network_name = azurerm_virtual_network.vmss.name
#   address_prefixes     = ["10.0.2.0/24"]
# }
#
# resource "azurerm_public_ip" "vmss" {
#   name                = "vmss-public-ip"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.vmss.name
#   allocation_method   = "Static"
#   domain_name_label   = random_string.fqdn.result
#   tags                = var.tags
# }
#
# resource "azurerm_lb" "vmss" {
#   name                = "vmss-lb"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.vmss.name
#
#   frontend_ip_configuration {
#     name                 = "PublicIPAddress"
#     public_ip_address_id = azurerm_public_ip.vmss.id
#   }
#
#   tags = var.tags
# }
#
# resource "azurerm_lb_backend_address_pool" "bpepool" {
#   loadbalancer_id = azurerm_lb.vmss.id
#   name            = "BackEndAddressPool"
# }
#
# resource "azurerm_lb_probe" "vmss" {
#   resource_group_name = azurerm_resource_group.vmss.name
#   loadbalancer_id     = azurerm_lb.vmss.id
#   name                = "ssh-running-probe"
#   port                = var.application_port
# }
#
# resource "azurerm_lb_rule" "lbnatrule" {
#   resource_group_name            = azurerm_resource_group.vmss.name
#   loadbalancer_id                = azurerm_lb.vmss.id
#   name                           = "http"
#   protocol                       = "Tcp"
#   frontend_port                  = var.application_port
#   backend_port                   = var.application_port
#   backend_address_pool_ids       = [azurerm_lb_backend_address_pool.bpepool.id]
#   frontend_ip_configuration_name = "PublicIPAddress"
#   probe_id                       = azurerm_lb_probe.vmss.id
# }
#
# resource "azurerm_virtual_machine_scale_set" "vmss" {
#   name                = "vmscaleset"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.vmss.name
#   upgrade_policy_mode = "Manual"
#
#   sku {
#     name     = "Standard_d2s_v3"
#     tier     = "Standard"
#     capacity = 2
#   }
#
#   storage_profile_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "16.04-LTS"
#     version   = "latest"
#   }
#
#   storage_profile_os_disk {
#     name              = ""
#     caching           = "ReadWrite"
#     create_option     = "FromImage"
#     managed_disk_type = "Standard_LRS"
#   }
#
#   storage_profile_data_disk {
#     lun           = 0
#     caching       = "ReadWrite"
#     create_option = "Empty"
#     disk_size_gb  = 10
#   }
#
#   os_profile {
#     computer_name_prefix = "vmlab"
#     admin_username       = var.admin_user
#     admin_password       = var.admin_password
#     custom_data          = file("web.conf")
#   }
#
#   os_profile_linux_config {
#     disable_password_authentication = false
#   }
#
#   network_profile {
#     name    = "terraformnetworkprofile"
#     primary = true
#
#     ip_configuration {
#       name                                   = "IPConfiguration"
#       subnet_id                              = azurerm_subnet.vmss.id
#       load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.bpepool.id]
#       primary                                = true
#     }
#   }
#
#   tags = var.tags
# }
#
# resource "azurerm_public_ip" "jumpbox" {
#   name                = "jumpbox-public-ip"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.vmss.name
#   allocation_method   = "Static"
#   domain_name_label   = "${random_string.fqdn.result}-ssh"
#   tags                = var.tags
# }
#
# resource "azurerm_network_interface" "jumpbox" {
#   name                = "jumpbox-nic"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.vmss.name
#
#   ip_configuration {
#     name                          = "IPConfiguration"
#     subnet_id                     = azurerm_subnet.vmss.id
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id          = azurerm_public_ip.jumpbox.id
#   }
#
#   tags = var.tags
# }
#
# resource "azurerm_virtual_machine" "jumpbox" {
#   name                  = "jumpbox"
#   location              = var.location
#   resource_group_name   = azurerm_resource_group.vmss.name
#   network_interface_ids = [azurerm_network_interface.jumpbox.id]
#   vm_size               = "Standard_DS1_v2"
#
#   storage_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "16.04-LTS"
#     version   = "latest"
#   }
#
#   storage_os_disk {
#     name              = "jumpbox-osdisk"
#     caching           = "ReadWrite"
#     create_option     = "FromImage"
#     managed_disk_type = "Standard_LRS"
#   }
#
#   os_profile {
#     computer_name  = "jumpbox"
#     admin_username = var.admin_user
#     admin_password = var.admin_password
#   }
#
#   os_profile_linux_config {
#     disable_password_authentication = false
#   }
#
#   tags = var.tags
# }
# # resource "azurerm_resource_group" "example" {
# #   name     = "example-resources"
# #   location = "west Europe"
# # }
# #
# # resource "azurerm_network_security_group" "example" {
# #   name                = "example-security-group"
# #   location            = azurerm_resource_group.example.location
# #   resource_group_name = azurerm_resource_group.example.name
# # }
#
# # resource "azurerm_virtual_network" "example-01" {
# #   name                = "example-network-01"
# #   location            = azurerm_resource_group.example.location
# #   resource_group_name = azurerm_resource_group.example.name
# #   address_space       = ["10.10.0.0/16"]
# #   subnet {
# #     name           = "subnet1"
# #     address_prefix = "10.10.1.0/24"
# #   }
# #
# #   subnet {
# #     name           = "subnet2"
# #     address_prefix = "10.10.2.0/24"
# # #     security_group = azurerm_network_security_group.example.id
# #   }
# #
# #   tags = {
# #     environment = "Test environment"
# #   }
# # }
# #
# # resource "azurerm_virtual_network" "example-02" {
# #   name                = "example-network-02"
# #   location            = azurerm_resource_group.example.location
# #   resource_group_name = azurerm_resource_group.example.name
# #   address_space       = ["10.11.0.0/16"]
# #   subnet {
# #     name           = "subnet1"
# #     address_prefix = "10.11.1.0/24"
# #   }
# #
# #   subnet {
# #     name           = "subnet2"
# #     address_prefix = "10.11.2.0/24"
# # #     security_group = azurerm_network_security_group.example.id
# #   }
# #
# #   tags = {
# #     environment = "Test environment-02"
# #   }
# # }
# #
# # resource "azurerm_virtual_network_peering" "example-01" {
# #   name                      = "peer1to2"
# #   resource_group_name       = azurerm_resource_group.example.name
# #   virtual_network_name      = azurerm_virtual_network.example-01.name
# #   remote_virtual_network_id = azurerm_virtual_network.example-02.id
# # }
# #
# # resource "azurerm_virtual_network_peering" "example-02" {
# #   name                      = "peer2to1"
# #   resource_group_name       = azurerm_resource_group.example.name
# #   virtual_network_name      = azurerm_virtual_network.example-02.name
# #   remote_virtual_network_id = azurerm_virtual_network.example-01.id
# # }
# #
# # locals {
# #   out_subnet_id =azurerm_virtual_network.example-01.subnet.*.id
# # }
#
# # resource "azurerm_network_interface" "example" {
# #   name                = "example-nic"
# #   location            = azurerm_resource_group.example.location
# #   resource_group_name = azurerm_resource_group.example.name
# #
# #   ip_configuration {
# #     name                          = "internal"
# #     subnet_id                     = local.out_subnet_id[0]
# #     private_ip_address_allocation = "Dynamic"
# #   }
# # }
#
# # resource "azurerm_linux_virtual_machine" "example" {
# #   name                = "example-machine"
# #   resource_group_name = azurerm_resource_group.example.name
# #   location            = azurerm_resource_group.example.location
# #   size                = "Standard_D2s_v5"
# #   admin_username      = "adminuser"
# #   network_interface_ids = [
# #     azurerm_network_interface.example.id,
# #   ]
# #
# #   admin_ssh_key {
# #     username   = "adminuser"
# #     public_key = file("~/.ssh/id_rsa.pub")
# #   }
# #
# #   os_disk {
# #     caching              = "ReadWrite"
# #     storage_account_type = "Standard_LRS"
# #   }
# #
# #   source_image_reference {
# #     publisher = "Canonical"
# #     offer     = "0001-com-ubuntu-server-jammy"
# #     sku       = "22_04-lts"
# #     version   = "latest"
# #   }
# # }
