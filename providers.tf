terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"


  default_tags {

    tags = {
      Application = "static_website"
      Owner       = "rujulzalte18"
    }
  }
}