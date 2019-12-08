variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "tag" {}

provider "aws" {
  region  = "us-east-1"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

terraform {
  backend "s3" {  
    bucket = "terraform-test-vaibhav"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "tf_instance" {
  ami           = "ami-0922553b7b0369273"
  instance_type = "t2.micro"
  tags {
    Name = "${var.tag}"
  }
}

output "region" {
    value = "us-east-1"
}

output "instanceTags" {
       value = "${aws_instance.tf_instance.tags}"
}
