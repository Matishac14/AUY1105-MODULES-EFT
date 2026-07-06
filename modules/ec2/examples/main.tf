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
  source = "../../vpc"

  project_name     = "eft-auy1105-project"
  environment      = "dev"
  allowed_ssh_cidr = var.my_ip
}

module "ec2" {
  source = "../"

  project_name       = "eft-auy1105-project"
  environment        = "dev"
  subnet_id          = module.vpc.subnet_ids[0]
  security_group_ids = [module.vpc.ssh_security_group_id]
}

output "instance_id" {
  value = module.ec2.instance_id
}

output "instance_ip" {
  value = module.ec2.instance_ip
}
