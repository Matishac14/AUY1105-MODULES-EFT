output "bucket_name" {
  description = "Nombre del bucket S3 creado."
  value       = aws_s3_bucket.this.bucket
}
