terraform {
  backend "s3" {  
    bucket = "yogesh-tf-test-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
resource "aws_security_group" "sg-test_1" {
  description = "dev_test security group allows ssh for everyone"
  name        = "allow-ssh-${var.tag_name}-${terraform.workspace}"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
