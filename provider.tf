terraform {
  backend "s3" {
    bucket         = "nittuv-tfstate-remote"
    key            = "network/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "dynamodb_tf_table"
  }
}

provider "aws" {
  access_key = var.ACCESS_KEY
  secret_key = var.SECRET_KEY
  region     = var.REGION
}