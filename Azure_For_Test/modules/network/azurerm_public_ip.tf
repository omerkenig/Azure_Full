resource "azurerm_public_ip" "example" {
  name                = "test"
  location            = var.resource_group_name.location
  resource_group_name = var.resource_group_name.name
  allocation_method   = var.allocation_method
  domain_name_label   = var.resource_group_name.name

  tags = {
    environment = "staging"
  }
}