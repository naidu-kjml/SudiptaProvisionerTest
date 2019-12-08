variable "access_key" {}
variable "secret_key" {}
    
provider "aws" {
       region = "us-east-1"
}

terraform {
  backend "s3" {  
    bucket = "terraform-test-vaibhav"
    region = "us-east-1"
  }
}

module "consul" {
  source = "git@github.com:wings-software/vaibhav-test.git"
}
