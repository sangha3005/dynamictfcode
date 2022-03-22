terraform {
  required_version = "~> 0.14"
  required_providers {
     aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
    region = "us-west-2"
    access_key = "AKIARX7LD6PWR7MAGYVP"
    secret_key = "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"
  }

/*  this code used for create extra instance in another region
  provider "aws" {
    alias = "east_1"
    region = "us-east-1"
  
  }*/