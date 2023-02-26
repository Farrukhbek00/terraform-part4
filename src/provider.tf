provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "farruh-tfstate-actions-2"
    key            = "application.tf"
    region         = "eu-west-1"
  }

  required_version = "= 1.3.9"
}
