resource "aws_instance" "this" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  key_name                    = var.key_name
  monitoring                  = true
  associate_public_ip_address = true

  metadata_options {
    http_tokens = "required"
  }

  root_block_device {
    encrypted = true
  }

  tags = {
    Name        = "AUY1105-${var.project_name}-ec2"
    Environment = var.environment
  }
}