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

variable "my_ip" {
  description = "CIDR autorizado para SSH (x.x.x.x/32)."
  type        = string
}

module "vpc" {
  source = "../"

  project_name     = "eft-auy1105-project"
  environment      = "dev"
  allowed_ssh_cidr = var.my_ip
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  value = module.vpc.subnet_ids
}

output "ssh_security_group_id" {
  value = module.vpc.ssh_security_group_id
}
