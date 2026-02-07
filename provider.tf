provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = ">= 1.5"
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "infra/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}
