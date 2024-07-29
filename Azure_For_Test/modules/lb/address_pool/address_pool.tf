resource "lb_backend_address_pool" "bpepool" {
  loadbalancer_id = var.lb_name
  name            = var.pool_name
}