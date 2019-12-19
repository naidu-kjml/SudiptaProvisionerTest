variable "a" {}
variable "sleep" {}

resource "null_resource" "delay" {
  provisioner "local-exec" {
    command = var.sleep
    interpreter = ["/bin/sleep"]
  }
}

output "a" {
  value = var.a
}
