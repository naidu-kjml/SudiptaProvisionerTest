terraform {
   backend "s3" {
     bucket = "harness-qa-automation"
     key    = "qa/terraform.tfstate"
     region = "us-east-1"
   }
}
