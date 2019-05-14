Single interfacee libvirt domain
================================

Sets up a libvirt domain with network configured using kea DHCP.


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| autostart | mark libvirt domain to autostart | string | `true` | no |
| consul_url | Consul url, http://<ip_address:port>; should not end with a slash. The DHCP reservation call is made at this URL. | string | - | yes |
| disk_format |  | string | `qcow2` | no |
| disk_size | The disk size of primary disk in bytes | string | `4096` | no |
| disk_two_size_gb | Size of secondary disk | string | `1` | no |
| fqdn | VM's fqdn | string | - | yes |
| hostname | VM instance hostname | string | - | yes |
| libvirt_host | IP address of host running libvirt | string | - | yes |
| mac_address | mac address of the VM | string | - | yes |
| memory_size | memory size of VM | string | `2048` | no |
| network_name | Libvirt network name | string | `default` | no |
| num_cpu | number of vCPU which VM has | string | `2` | no |
| pool_name | name of pool to store disk and iso image | string | `default` | no |
| source_path | path to qcow2 base image, can be remote url or local disk path | string | - | yes |
| user_data | cloud init user-data | string | - | yes |

