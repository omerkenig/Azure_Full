resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = "East US"
}

resource "azurerm_virtual_network" "main" {
  name                = var.virtual_machine_name
  address_space = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "internal" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "example" {
  #   name                = "acceptanceTestPublicIp1-${count.index + 1}"
  name                = var.public_ip_name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"
#   count               = var.NumberOfMachines
}

resource "azurerm_network_interface" "example" {
#   name                = "example-nic-${count.index + 1}"
    name                = "example-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
#   count               = var.NumberOfMachines

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example.id
  }
}

resource "azurerm_network_security_group" "example" {
  name                = "acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
#   network_interface_id      = azurerm_network_interface.example[count.index].id
  network_interface_id      = azurerm_network_interface.example.id
  network_security_group_id = azurerm_network_security_group.example.id
#   count                     = var.NumberOfMachines
}

resource "azurerm_linux_virtual_machine" "example" {
  #     name                            = "example-vm-${count.index + 1}"
  name = var.virtual_machine_name
  #   count                           = var.NumberOfMachines
  resource_group_name             = azurerm_resource_group.example.name
  location                        = azurerm_resource_group.example.location
  size = "Standard_D2s_v3"
  #   computer_name                   = "hostName-${count.index + 1}"
  computer_name                   = "OmerVm"
  admin_username                  = "adminuser"
  admin_password                  = "Windows@123456"
  disable_password_authentication = false
  #   network_interface_ids = [
  #     azurerm_network_interface.example[count.index].id,
  #   ]
  network_interface_ids           = [azurerm_network_interface.example.id]
  os_disk {
    #     name                 = "osdisk-${count.index + 1}"
    name                 = "osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  priority        = "Spot"
  max_bid_price   = -1
  eviction_policy = "Deallocate"
}
