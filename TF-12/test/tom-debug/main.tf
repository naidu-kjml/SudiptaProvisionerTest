variable "access_key" {}
variable "secret_key" {}

variable "region" {
       type = "string"
       default = "us-east-1"
       }


variable "myfirstec2_tags" {
       type = "map"
       default = {
               name = "tfmyfirstec2"
       }
}       


provider "aws" {
       region = "${var.region}"
       access_key = "${var.access_key}"
       secret_key = "${var.secret_key}"
}

resource "aws_instance" "myfirstec2" {
       ami = "ami-41e0b93b"
       instance_type = "t2.micro"
       tags = "${var.myfirstec2_tags}"
       key_name = "vaibhav_key_pair"
       vpc_security_group_ids = ["sg-a9fb9ae2"]
}

output "region" {
       value = "${var.region}"
}

output "myfirstec2_tags" {
       value = "${var.myfirstec2_tags}"
}
output "security_group" {
       value = ["${aws_instance.myfirstec2.vpc_security_group_ids}"]
}
