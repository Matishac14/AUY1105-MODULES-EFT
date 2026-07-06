variable "project_name" {
  description = "Nombre del proyecto. Se usa como prefijo de los recursos."
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue (dev, qa, prod)."
  type        = string
}

variable "subnet_id" {
  description = "ID de la subnet donde se lanzará la instancia EC2. Debe ser una subnet pública si se requiere IP pública."
  type        = string
}

variable "security_group_ids" {
  description = "Lista de IDs de security groups a asociar a la instancia."
  type        = list(string)
}

variable "ami_id" {
  description = "AMI a usar para la instancia EC2 (Ubuntu por defecto en us-east-1)."
  type        = string
  default     = "ami-0ec10929233384c7f"
}

variable "instance_type" {
  description = "Tipo de instancia EC2."
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Nombre del key pair en AWS para acceso SSH."
  type        = string
  default     = "vockey"
}
