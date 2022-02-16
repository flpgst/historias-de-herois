# Backend for store stage file
terraform {
  backend "s3" {
    encrypt = false
  }
}

provider "aws" {
  region  = "${var.REGION}"
  version = "2.17"
}

provider "aws" {
  alias   = "global"
  version = "2.17"
  region  = "us-east-1"
}
