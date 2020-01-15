variable "access_key" {}
variable "secret_key" {}
    
provider "aws" {
       region = "us-east-1"
       access_key = "${var.access_key}"
       secret_key = "${var.secret_key}"
}

provider "aws" {
  alias  = "usw2"
  region = "us-west-1"
  access_key = "${var.access_key}"
   secret_key = "${var.secret_key}"
}



# module "security-group" {
#   source  = "terraform-aws-modules/security-group/aws"
#   version = "2.9.0"

#   # insert the 2 required variables here
#   name = "test"
#   vpc_id = "vpc-e703539f"
# }

module "child" {
	source = "../child"
	providers = {
	    aws = "aws.usw2"
  	}

  	test = "test"
}
