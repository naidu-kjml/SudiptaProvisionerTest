variable "x" {}
variable "delay" {}


resource "null_resource" "delay" {
  provisioner "local-exec" {
    command = "sleep ${var.delay}"
  }
}

output "a" {
  value = "${var.x}"
}
