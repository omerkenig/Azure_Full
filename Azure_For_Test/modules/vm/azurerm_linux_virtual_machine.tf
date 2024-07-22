
resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = var.resource_group_name.example.name
  location            = var.resource_group_name.example.location
  size                = var.size
  admin_username      = "adminuser"

  admin_ssh_key {
    username = var.username
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  network_interface_ids = [var.azurerm_network_interface.example.id]
}