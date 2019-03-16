variable "region" {}

variable "tags" {
  type = "map"

  default = {
    "service"    = "haomingyin.com"
    "created-by" = "terraform"
    "owner"      = "haoming.yin"
    "repo"       = "terraform.aws-rds"
  }
}
