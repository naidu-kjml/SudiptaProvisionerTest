variable "key" {
  type = "string"
}

variable "images" {
  type = "map"

  default = {
    us-east-1 = "image-1234"
    us-west-2 = "image-4567"
  }
}

variable "zones" {
  type = "list"
  default = ["us-east-1a", "us-east-1b"]
}

resource "null_resource" "cluster" {}

output "key" {
  value = "${var.key}"
}

output "images-all" {
  value = "${var.images}"
}
output "images-east-1" {
  value = "${var.images["us-east-1"]}"
}

output "zones" {
 value = "${var.zones}"
}
