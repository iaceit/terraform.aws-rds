terraform {
    version = ">= 0.11.11"

    backend "s3" {
        region = "ap-southeast-2"
        bucket = "973039937378-infra"
        key = "haomingyin.com/terraform/aws-rds/ap-southeast-2/terraform.tfstate"
    }
}