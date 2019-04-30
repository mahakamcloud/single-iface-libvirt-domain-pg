variable libvirt_host {
  type        = "string"
  description = "IP address of host running libvirt"
}

variable instance_name {
  type        = "string"
  description = "name of VM instance"
}

variable pool_name {
  type        = "string"
  default     = "default"
  description = "name of pool to store disk and iso image"
}

variable source_path {
  type        = "string"
  description = "path to qcow2 base image, can be remote url or local disk path"
}

variable disk_format {
  type    = "string"
  default = "qcow2"
}

variable disk_size {
  description = "The disk size of primary disk in bytes"
  type        = "string"
  default     = "4096"
}

variable memory_size {
  type        = "string"
  default     = "2048"
  description = "memory size of VM"
}

variable num_cpu {
  default     = 2
  description = "number of vCPU which VM has"
}

variable network_name {
  type        = "string"
  default     = "default"
  description = "Libvirt network name"
}

variable autostart {
  default     = "true"
  type        = "string"
  description = "mark libvirt domain to autostart"
}

variable mac_address {
  type        = "string"
  description = "mac address of the VM"
}

variable disk_two_size_gb {
  default     = "1"
  type        = "string"
  description = "Size of secondary disk"
}

variable user_data {
  type        = "string"
  description = "cloud init user-data"
}
