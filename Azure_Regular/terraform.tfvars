# # NumberOfMachines = 1
# variable "virtual-machine" {
#   type = map(object({
#     vm_name = string
#     nic_name = string
#     ip_name = string
#   }))
#   default = {
#     vm1 = {
#       vm_name = "webServer"
#       nic_name = "webServer_nic"
#       ip_name = "webServer_ip"
#     }
#     vm2 = {
#       vm_name = "appServer"
#       nic_name = "appServer_nic"
#       ip_name = "appServer_ip"
#     }
#     vm3 = {
#       vm_name = "dbServer"
#       nic_name = "dbServer_nic"
#       ip_name = "dbServer_ip"
#     }
#   }
# }