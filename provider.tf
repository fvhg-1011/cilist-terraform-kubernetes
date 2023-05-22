terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}

provider "aws" {
  region                   = "ap-southeast-3"
  shared_credentials_files = var.credential_path
}
