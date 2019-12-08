variable "access_key" {
}

variable "secret_key" {
}

variable "owner" {}

provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

#terraform {
 #  backend "s3" {  
  #   key    = "terraform.tfstate"
   #  region = "us-east-1"
   #}
# }

resource "aws_s3_bucket" "b" {
  bucket        = "yogesh-tf-test-bucket"
  force_destroy = "true"

  tags = {
    Name = "yogesh_test"
    Owner = var.owner
  }
}

