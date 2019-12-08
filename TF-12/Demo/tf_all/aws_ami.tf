data "aws_ami" "example" {
  most_recent = true
  provider = "aws.west"

  owners = ["448640225317"]
  tags = {
    Name   = "BLROfficeTraining"
  }
}

output "ami_id" {
	value = data.aws_ami.example
}

