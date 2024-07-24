# resource "azurerm_resource_group" "vmss" {
# #   name     = var.name
#   location = var.location
#   tags     = var.tags
#
# }
resource "azurerm_resource_group" "vmss" {
  name     = var.azurerm_resource_group_name
  location = var.location
  tags     = var.tags
}