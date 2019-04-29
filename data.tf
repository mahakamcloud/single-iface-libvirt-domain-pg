data "template_file" "user_data" {
  template = "${file("${path.module}/templates/user_data.tpl")}"

  vars {
    password      = "${var.password}"
    instance_name = "${var.instance_name}"
  }
}
