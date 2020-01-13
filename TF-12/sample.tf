variable "access_key" {
}
variable "secret_key" {
}
variable "tag" {
}
provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}
resource "aws_instance" "tf_instance" {
  ami           = "ami-0922553b7b0369273"
  instance_type = "t2.micro"
  tags = {
    Name = var.tag
  }
}
