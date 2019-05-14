resource "null_resource" "dhcp_reservation" {
  provisioner "local-exec" {
    command = "curl --request PUT --data '{\"hw-address\":\"${var.mac_address}\",\"hostname\":\"${var.hostname}\"}' ${var.consul_url}/v1/kv/dhcp4/reservations/${var.hostname}"
  }
}

resource "libvirt_volume" "main" {
  name   = "${var.hostname}"
  pool   = "${var.pool_name}"
  source = "${var.source_path}"
  format = "${var.disk_format}"
  depends_on = ["null_resource.dhcp_reservation"]
}

resource "libvirt_volume" "secondary" {
  name = "${var.hostname}-secondary"
  size = "${var.disk_two_size_gb * 1024 * 1024 * 1024 }"
  depends_on = ["null_resource.dhcp_reservation"]
}

resource "libvirt_cloudinit_disk" "vm_init" {
  name      = "${var.hostname}-init.iso"
  user_data = "${var.user_data}"
  depends_on = ["null_resource.dhcp_reservation"]
}

resource "libvirt_domain" "vm_domain" {
  name      = "${var.fqdn}"
  memory    = "${var.memory_size}"
  vcpu      = "${var.num_cpu}"
  autostart = "${var.autostart}"

  cloudinit = "${libvirt_cloudinit_disk.vm_init.id}"

  network_interface {
    network_name   = "${var.network_name}"
    hostname       = "${var.fqdn}"
    mac            = "${var.mac_address}"
    wait_for_lease = false
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  disk {
    volume_id = "${libvirt_volume.main.id}"
  }

  disk {
    volume_id = "${libvirt_volume.secondary.id}"
  }

  provisioner "local-exec" {
    when    = "destroy"
    command = "curl --request DELETE ${var.consul_url}/v1/kv/dhcp4/reservations/${var.hostname}"
  }

  depends_on = ["null_resource.dhcp_reservation"]
}
