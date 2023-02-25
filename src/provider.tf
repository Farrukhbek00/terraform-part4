provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "farruh-tfstate-part2"
    key            = "application.tf"
    region         = "eu-west-1"
    dynamodb_table = "part2locktable"
  }

  required_version = "= 1.3.9"
}
