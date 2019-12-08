variable "access_key" {}
variable "access_key 1 " {}
variable "access_key 2 " {}
variable "access_key 3 " {}
variable "access_key 4 " {}
variable "access_key 5 " {}
variable "access_key 6 " {}
variable "access_key 7 " {}
variable "access_key 8 " {}
variable "access_key 9 " {}
variable "access_key 10 " {}
variable "access_key 11 " {}
variable "access_key 12 " {}
variable "access_key 13 " {}
variable "access_key 14 " {}
variable "access_key 15 " {}
variable "access_key 16 " {}
variable "access_key 17 " {}
variable "access_key 18 " {}
variable "access_key 19 " {}
variable "access_key 20 " {}
variable "access_key 21 " {}
variable "access_key 22 " {}
variable "access_key 23 " {}
variable "access_key 24 " {}
variable "access_key 25 " {}
variable "access_key 26 " {}
variable "access_key 27 " {}
variable "access_key 28 " {}
variable "access_key 29 " {}
variable "access_key 30 " {}
variable "access_key 31 " {}
variable "access_key 32 " {}
variable "access_key 33 " {}
variable "access_key 34 " {}
variable "access_key 35 " {}
variable "access_key 36 " {}
variable "access_key 37 " {}
variable "access_key 38 " {}
variable "access_key 39 " {}
variable "access_key 40 " {}
variable "access_key 41 " {}
variable "access_key 42 " {}
variable "access_key 43 " {}
variable "access_key 44 " {}
variable "access_key 45 " {}
variable "access_key 46 " {}
variable "access_key 47 " {}
variable "access_key 48 " {}
variable "access_key 49 " {}
variable "access_key 50 " {}
variable "access_key 51 " {}
variable "access_key 52 " {}
variable "access_key 53 " {}
variable "access_key 54 " {}
variable "access_key 55 " {}
variable "access_key 56 " {}
variable "access_key 57 " {}
variable "access_key 58 " {}
variable "access_key 59 " {}
variable "access_key 60 " {}
variable "access_key 61 " {}
variable "access_key 62 " {}
variable "access_key 63 " {}
variable "access_key 64 " {}
variable "access_key 65 " {}
variable "access_key 66 " {}
variable "access_key 67 " {}
variable "access_key 68 " {}
variable "access_key 69 " {}
variable "access_key 70 " {}
variable "access_key 71 " {}
variable "access_key 72 " {}
variable "access_key 73 " {}
variable "access_key 74 " {}
variable "access_key 75 " {}
variable "access_key 76 " {}
variable "access_key 77 " {}
variable "access_key 78 " {}
variable "access_key 79 " {}
variable "access_key 80 " {}
variable "access_key 81 " {}
variable "access_key 82 " {}
variable "access_key 83 " {}
variable "access_key 84 " {}
variable "access_key 85 " {}
variable "access_key 86 " {}
variable "access_key 87 " {}
variable "access_key 88 " {}
variable "access_key 89 " {}
variable "access_key 90 " {}
variable "access_key 91 " {}
variable "access_key 92 " {}
variable "access_key 93 " {}
variable "access_key 94 " {}
variable "access_key 95 " {}
variable "access_key 96 " {}
variable "access_key 97 " {}
variable "access_key 98 " {}
variable "access_key 99 " {}
variable "access_key 100 " {}
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
