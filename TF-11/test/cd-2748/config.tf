variable "access_key" {}
variable "secret_key" {}

provider "aws" {
  region  = "us-east-1"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

terraform {
  backend "s3" {  
    bucket = "terraform-test-vaibhav"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

locals {
  counts = {
      "default"=1
      "production"=3
  }
}

resource "aws_instance" "my_service" {
  ami="ami-7b4d7900"
  instance_type="t2.micro"
  count="${lookup(local.counts, terraform.workspace, 2)}"
  tags {
         Name = "${terraform.workspace}"
    }
}
