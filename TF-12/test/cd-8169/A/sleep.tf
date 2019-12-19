variable "a" {}
variable "b" {}

resource "null_resource" "delay" {
  provisioner "local-exec" {
    command = var.b
  }
}

output "a" {
  value = var.a
}
