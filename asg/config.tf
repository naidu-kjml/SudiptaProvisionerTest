variable "access_key" {
}

variable "secret_key" {
}

variable "region" {
  default = "us-west-1"
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = "us-west-1"
}

resource "aws_autoscaling_group" "autoscaling-group-test" {
  name                 = "yogesh"
  max_size             = "5"
  min_size             = "1"
  desired_capacity     = "1"
  vpc_zone_identifier  = ["subnet-4b21b72c"]
  launch_configuration = aws_launch_configuration.launch-configuration-test.name
  health_check_type    = "ELB"
}

resource "aws_launch_configuration" "launch-configuration-test" {
  name                 = "yogesh"
  image_id             = "ami-015954d5e5548d13b"
  instance_type        = "t2.medium"
  iam_instance_profile = "ecsInstanceRole"

  root_block_device {
    volume_type           = "standard"
    volume_size           = 100
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }

  security_groups             = ["sg-3346d04b"]
  associate_public_ip_address = "true"
  key_name                    = "yogesh"
}

output "region" {
  value = var.region
}

output "asg" {
  value = aws_autoscaling_group.autoscaling-group-test.name
}

