
variable "access_key" {}
variable "secret_key" {}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "us-east-1"
}

output "clusterName" {
	value = "abc"
}

output "region" {
	value = "us-east-1"
}
