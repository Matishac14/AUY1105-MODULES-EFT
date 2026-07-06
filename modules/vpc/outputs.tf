output "vpc_id" {
  description = "ID de la VPC creada."
  value       = aws_vpc.this.id
}

output "subnet_ids" {
  description = "IDs de las subnets creadas (públicas y privadas)."
  value       = concat(aws_subnet.public[*].id, aws_subnet.private[*].id)
}

output "ssh_security_group_id" {
  description = "ID del security group SSH. Consumido por el módulo ec2."
  value       = aws_security_group.ssh.id
}
