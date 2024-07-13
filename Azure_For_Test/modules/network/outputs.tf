output "virtual_network_id" {
  description = "ID of the Virtual Network"
  value       = azurerm_virtual_network.Omer_vnet.id
}

output "subnet_ids" {
  value = {
    public_subnet_id  = azurerm_subnet.subnets[1].id
    private_subnet_id = azurerm_subnet.subnets[0].id
    jumpbox_subnet_id = azurerm_subnet.subnets[2].id
    # Add other subnets as needed
  }
}