variable "global_access_key" {type="string"}
variable "global_secret_key" {type="string"}


provider "aws" {
 region = "ap-southeast-2"
 access_key = "${var.global_access_key}"
 secret_key = "${var.global_secret_key}"
}

resource "aws_instance" "example" {
 ami = "ami-0c9d48b5db609ad6e"
 instance_type = "t2.micro"

 user_data = <<-EOF
             #!/bin/bash
             echo "Hello, World" > index.html
             nohup busybox httpd -f -p 8080 &
             EOF
 tags {
   Name = "terraform-example"
 }



}

output "global_access_key" {
 value = "${var.global_access_key}"
}

output "secret_key" {
 value = "${var.global_secret_key}"
}

#variable "access_key" {}
#variable "secret_key" {}
#    
#provider "aws" {
#       region = "us-east-1"
#       access_key = "${var.access_key}"
#       secret_key = "${var.secret_key}"
#}
#
#resource "aws_s3_bucket" "bucket" {
#  bucket = "eng-demo"
#}
