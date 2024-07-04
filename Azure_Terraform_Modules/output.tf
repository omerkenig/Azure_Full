output "vm_public_ip" {
  value = module.vm_and_vpn.vm_public_ip
}

output "vpn_gateway_public_ip" {
  value = module.vm_and_vpn.vpn_gateway_public_ip
}