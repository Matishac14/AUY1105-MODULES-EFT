terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0, < 7.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "bucket_name" {
  description = "Nombre único del bucket de prueba."
  type        = string
}

module "s3" {
  source = "../"

  bucket_name = var.bucket_name
  environment = "dev"
}

output "bucket_name" {
  value = module.s3.bucket_name
}
