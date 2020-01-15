variable "access_key" {}
variable "secret_key" {}
variable "region" {
    default = "us-east-1"
}
variable "tag" {
  type = "map"
  default = {
    "Name" = "TF-provisioner-Don't kill - For daily execution"
  }
}

provider "aws" {
       region = "${var.region}"
       access_key = "${var.access_key}"
       secret_key = "${var.secret_key}"
}

output "region" {
    value = "${var.region}"
}

output "tag" {
    value = "${var.tag}"
}
