# Ejemplo — Módulo s3

Despliega un bucket S3 con el nombre que indiques.

## Uso

```bash
cd modules/s3/examples

export TF_VAR_bucket_name="auy1105-grupo4-prueba-$(date +%s)"

terraform init
terraform validate
terraform plan
terraform apply
terraform destroy   # al terminar
```

## Outputs esperados

- `bucket_name`
