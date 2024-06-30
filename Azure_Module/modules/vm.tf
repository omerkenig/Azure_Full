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
