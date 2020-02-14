variable "region" {
  default = "ap-southeast-2"
}

variable "tags" {
  type = map(string)

  default = {
    "service"    = "iaceit.com"
    "created-by" = "terraform"
    "owner"      = "iaceit.yin"
    "repo"       = "terraform.aws-rds"
  }
}

