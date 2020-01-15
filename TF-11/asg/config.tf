variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "us-east-1"
}


resource "aws_autoscaling_group" "autoscaling-group-test" {
    name                        = "asg-test"
    max_size                    = "5"
    min_size                    = "1"
    desired_capacity            = "1"
    vpc_zone_identifier         = ["subnet-e7c283ac","subnet-e962248d","subnet-5c0fe853","subnet-9d6cd6b2","subnet-09229d54","subnet-ed0a96d2"]
    launch_configuration        = "${aws_launch_configuration.launch-configuration-test.name}"
    health_check_type           = "ELB"
  }

  resource "aws_launch_configuration" "launch-configuration-test" {
    name                        = "lc-test"
    image_id                    = "ami-0b9a214f40c38d5eb"
    instance_type               = "t2.medium"
    iam_instance_profile        = "ecsInstanceRole"

    root_block_device {
      volume_type = "standard"
      volume_size = 100
      delete_on_termination = true
    }

    lifecycle {
      create_before_destroy = true
    }

    security_groups             = ["sg-a9fb9ae2"]
    associate_public_ip_address = "true"
    key_name                    = "vaibhav_key_pair"
}


output "region" {
	value = "${var.region}"
}

output "asg" {
  value = "${aws_autoscaling_group.autoscaling-group-test.name}"
}
