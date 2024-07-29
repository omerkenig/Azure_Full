resource "azurerm_public_ip" "jumpbox" {
  name                = "jumpbox-public-ip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  domain_name_label   = "${random_string.fqdn.result}-ssh"
  tags                = var.tags
}