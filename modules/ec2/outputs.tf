output "instance_id" {
  description = "ID de la instancia EC2 creada."
  value       = aws_instance.this.id
}

output "instance_ip" {
  description = "IP pública asignada a la instancia EC2 (si la subnet es pública)."
  value       = aws_instance.this.public_ip
}
