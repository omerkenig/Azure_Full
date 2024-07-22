resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = var.resource_group_name.example.location
  resource_group_name = var.resource_group_name.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = local.out_subnet_id[0]
    private_ip_address_allocation = "Dynamic"
  }
}