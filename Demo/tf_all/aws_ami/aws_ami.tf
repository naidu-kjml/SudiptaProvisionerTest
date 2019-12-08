provider "aws" {
  region  = "us-east-1"
}

data "aws_ami" "example" {
  most_recent = true
  owners = ["self"]
}

output "ami_id" {
	value = data.aws_ami.example.id
}

resource "null_resource" "ec2" {
  provisioner "local-exec" {
    command = "echo ${data.aws_ami.example.id} > ~/ami_data.txt"
    interpreter = ["/bin/bash", "-c"]
  }
}

