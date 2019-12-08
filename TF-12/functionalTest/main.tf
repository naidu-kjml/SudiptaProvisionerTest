#Please do not change this file. This is used for functional test in the code.

variable "access_key" {}
variable "secret_key" {}

provider "aws" {
  region  = "us-east-1"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

resource "local_file" "foo" {
    content     = "foo!"
    filename = "${path.module}/foo.bar"
}
