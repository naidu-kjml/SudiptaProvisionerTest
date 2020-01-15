variable "test" {}

resource "aws_s3_bucket" "example" {
  bucket = "provider-explicit-example3"
}
