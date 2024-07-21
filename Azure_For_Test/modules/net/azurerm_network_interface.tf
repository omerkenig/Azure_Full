resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = var.azurerm_resource_group.example.location
  resource_group_name = var.azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = local.out_subnet_id[0]
    private_ip_address_allocation = "Dynamic"
  }
}