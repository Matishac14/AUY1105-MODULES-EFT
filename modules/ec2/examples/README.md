# Ejemplo — Módulo ec2

Despliega una VPC (vía el módulo `vpc` del mismo repo) y una instancia EC2 `t2.micro` en la primera subnet pública.

## Uso

```bash
cd modules/ec2/examples

export TF_VAR_my_ip="203.0.113.10/32"

terraform init
terraform validate
terraform plan
terraform apply
terraform destroy   # al terminar
```

## Outputs esperados

- `instance_id`
- `instance_ip`
