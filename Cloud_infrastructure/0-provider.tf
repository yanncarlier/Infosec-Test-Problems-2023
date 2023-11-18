provider "aws" {
  region = "ap-southeast-1"
}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.26.0"
    }
  }
}


terraform {
  backend "s3" {
    bucket         = "s3backendbucket0"
    key            = "state/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
    dynamodb_table = "table_terraform0"
  }
}