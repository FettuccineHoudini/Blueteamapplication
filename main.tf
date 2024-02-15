# The TF files will be using references from our TF Lecture 

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "blue-team-tf-backend"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}


provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = var.default_tags
  }
}

