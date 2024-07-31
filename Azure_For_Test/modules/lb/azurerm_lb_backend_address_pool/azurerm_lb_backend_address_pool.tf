resource "azurerm_lb_backend_address_pool" "bpepool" {
  loadbalancer_id = var.lb_id
  name            = var.pool_name
}