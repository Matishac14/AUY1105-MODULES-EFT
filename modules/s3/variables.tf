variable "bucket_name" {
  description = "Nombre del bucket S3. Debe ser único a nivel global en AWS."
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue (dev, qa, prod). Se aplica como tag."
  type        = string
}
