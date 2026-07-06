variable "project_name" {
  description = "Nombre del proyecto. Se usa como prefijo de los recursos."
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue (dev, qa, prod)."
  type        = string
}

variable "cidr_block" {
  description = "Bloque CIDR principal de la VPC."
  type        = string
  default     = "10.1.0.0/16"
}

variable "availability_zones" {
  description = "AZs donde se crearán las subnets."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "public_subnet_cidrs" {
  description = "CIDRs de subnets públicas. Su tamaño debe coincidir con availability_zones."
  type        = list(string)
  default     = ["10.1.101.0/24", "10.1.102.0/24", "10.1.103.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDRs de subnets privadas. Su tamaño debe coincidir con availability_zones."
  type        = list(string)
  default     = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
}

variable "allowed_ssh_cidr" {
  description = "CIDR autorizado para SSH (puerto 22) al security group del módulo."
  type        = string
}
