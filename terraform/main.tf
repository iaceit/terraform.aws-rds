terraform {
  required_version = ">= 0.12"

  backend "s3" {
    region = "us-east-1"
    bucket = "iaceit.com"
    key    = "iaceit.com/terraform/aws-rds/ap-southeast-2/terraform.tfstate"
  }
}

