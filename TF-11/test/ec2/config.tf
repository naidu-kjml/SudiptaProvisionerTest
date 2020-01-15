variable "region" {
    default = "us-east-1"
}
variable "tag" {
  type = "map"
  default = {
    "Name" = "TF-provisioner-Don't kill - For daily execution"
  }
}

output "region" {
    value = "${var.region}"
}

output "tag" {
    value = "${var.tag}"
}
