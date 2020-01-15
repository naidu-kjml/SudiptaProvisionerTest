variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}
variable "key_pair_name" {}
variable "tag-for-resources" {}
	
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "us-east-1"
}

variable "capacity" {}

resource "aws_ecs_cluster" "test-ecs-cluster" {
    name = "ecs-${var.tag-for-resources}"
}

resource "aws_autoscaling_group" "ecs-autoscaling-group" {
    name                        = "ecs-asg-${var.tag-for-resources}"
    max_size                    = "5"
    min_size                    = "1"
    desired_capacity            = "${var.capacity}"
    vpc_zone_identifier         = ["subnet-e7c283ac","subnet-e962248d","subnet-5c0fe853","subnet-9d6cd6b2","subnet-09229d54","subnet-ed0a96d2"]
    launch_configuration        = "${aws_launch_configuration.ecs-launch-configuration.name}"
    health_check_type           = "ELB"
	
    tag {
      key                 = "Name"
      value               = "${var.tag-for-resources}"
      propagate_at_launch = true
    }	
  }

  resource "aws_launch_configuration" "ecs-launch-configuration" {
    name                        = "ecs-lb-${var.tag-for-resources}"
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
    key_name                    = "${var.key_pair_name}"
    user_data                   = <<EOF
                                  #!/bin/bash
                                  echo ECS_CLUSTER=${aws_ecs_cluster.test-ecs-cluster.name} >> /etc/ecs/ecs.config
                                  EOF
    	
}

#Requires Access but here for reference
#resource "aws_iam_role" "ecs-service-role" {
#    name                = "ecs-service-role-${var.tag-for-resources}"
#    path                = "/"
#    assume_role_policy  = "${data.aws_iam_policy_document.ecs-service-policy.json}"
#}
#
#resource "aws_iam_role_policy_attachment" "ecs-service-role-attachment" {
#    role       = "${aws_iam_role.ecs-service-role.name}"
#    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
#}
#
#data "aws_iam_policy_document" "ecs-service-policy" {
#    statement {
#        actions = ["sts:AssumeRole"]
#
#        principals {
#            type        = "Service"
#            identifiers = ["ecs.amazonaws.com"]
#        }
#    }
#}

resource "aws_alb" "ecs-load-balancer" {
    name                = "ecs-lb-${var.tag-for-resources}"
    security_groups     = ["sg-2aadb15f"]
    subnets             = ["subnet-e7c283ac","subnet-e962248d","subnet-5c0fe853","subnet-9d6cd6b2","subnet-09229d54","subnet-ed0a96d2"]

    tags {
      Name = "ecs-load-balancer-${var.tag-for-resources}"
    }
}

resource "aws_alb_target_group" "ecs-target-group" {
    name                = "ecs-tg-${var.tag-for-resources}"
    port                = "8080"
    protocol            = "HTTP"
    vpc_id              = "vpc-e703539f"

    health_check {
        healthy_threshold   = "5"
        unhealthy_threshold = "2"
        interval            = "30"
        matcher             = "200"
        path                = "/"
        port                = "traffic-port"
        protocol            = "HTTP"
        timeout             = "5"
    }

    tags {
      Name = "ecs-target-group-${var.tag-for-resources}"
    }
}

resource "aws_alb_listener" "alb-listener" {
    load_balancer_arn = "${aws_alb.ecs-load-balancer.arn}"
    port              = "80"
    protocol          = "HTTP"

    default_action {
        target_group_arn = "${aws_alb_target_group.ecs-target-group.arn}"
        type             = "forward"
    }
}

output "clusterName" {
	value = "${aws_ecs_cluster.test-ecs-cluster.name}"
}

output "region" {
	value = "${var.region}"
}

output "elb" {
	value = "${aws_alb.ecs-load-balancer.name}"
}

output "tg" {
	value = "${aws_alb_target_group.ecs-target-group.arn}"
}

output "iamrole" {
	value="arn:aws:iam::448640225317:role/aws-service-role/ecs.amazonaws.com/AWSServiceRoleForECS"
}

output "lb-dns" {
	value = "${aws_alb.ecs-load-balancer.dns_name}"
}
