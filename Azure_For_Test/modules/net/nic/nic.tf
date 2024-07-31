resource "azurerm_network_interface" "jumpbox" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.nic_ip_config
    subnet_id                     = var.subnet_id_output
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = var.public_ip_jumpbox_id
  }

  tags = var.tags
}