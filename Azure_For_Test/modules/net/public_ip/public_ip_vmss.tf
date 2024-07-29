resource "azurerm_public_ip" "vmss" {
  name                = var.public_ip
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  domain_name_label   = random_string.fqdn.result
  tags                = var.tags
}

