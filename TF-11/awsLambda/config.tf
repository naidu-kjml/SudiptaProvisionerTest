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


# resource "aws_lambda_function" "demo_lambda" {
# 	function_name = "demofunction"
# 	handler = "index1.handler"
# 	runtime = "nodejs6.10"
# 	s3_bucket = "terraform-test-vaibhav"
# 	s3_key    = "functions/tf.zip"
# 	role = "arn:aws:iam::448640225317:role/service-role/TestAwsLamdaRole"
	
# 	vpc_config = {
# 		subnet_ids = ["subnet-e962248d"]
# 		security_group_ids = ["sg-00576a78ea0b092b9"]
# 	}
	
# }

output "region" {
	 value = "${var.region}"
}


output "role" {
	 value = "arn:aws:iam::448640225317:role/service-role/TestAwsLamdaRole"
}

# output "function_name" {
# 	value = "${aws_lambda_function.demo_lambda.function_name}"
# }

# output "subnet_ids" {
# 	value = "${aws_lambda_function.demo_lambda.vpc_config.0.subnet_ids}"
# }

# output "securityGroups" {
# 	value = "${aws_lambda_function.demo_lambda.vpc_config.0.security_group_ids}"
# }

# output "vpc" {
# 	value = "${aws_lambda_function.demo_lambda.vpc_config.0.vpc_id}"
# }
