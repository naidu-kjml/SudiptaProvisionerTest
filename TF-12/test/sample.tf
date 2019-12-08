variable "global_access_key" {}
variable "global_secret_key" {}

data "terraform_remote_state" "harness" {
backend = "s3"

config = {
access_key = "${var.global_access_key}"
secret_key = "${var.global_secret_key}"
bucket     = "harness-terraform"
key        = "harness/terraform.tfstate"
region     = "us-west-2"
}
}
