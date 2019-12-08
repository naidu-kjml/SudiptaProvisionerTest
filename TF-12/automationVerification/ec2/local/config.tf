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

resource "aws_security_group" "sg-test" {
  description = "dev_test security group for testing in QA"
  name        = "qa-test-local"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "region" {
    value = "${var.region}"
}

output "tag" {
    value = "${var.tag}"
}
