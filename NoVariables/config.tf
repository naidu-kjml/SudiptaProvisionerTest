
provider "aws" {
  region     = "us-east-1"
  access_key =  "a"
  secret_key =  "b"
}

resource "aws_s3_bucket" "b" {
  bucket        = "yogesh-tf-test-bucket"
  force_destroy = "true"

  tags = {
    Name = "yogesh_test"
  }
}

