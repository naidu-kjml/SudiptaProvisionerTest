variable "v1" {}
variable "v2" {}

output "v1" {
  value = "${var.v1}"
}

output "v2" {
  value = "${var.v2}"
}
