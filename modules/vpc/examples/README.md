# Ejemplo — Módulo vpc

Ejecuta el módulo con valores por defecto (CIDR `10.1.0.0/16`, 3 AZs en `us-east-1`, 3 subnets públicas, 3 privadas) y un security group SSH abierto al CIDR que indiques en `my_ip`.

## Uso

```bash
cd modules/vpc/examples

export TF_VAR_my_ip="203.0.113.10/32"   # reemplaza por tu IP/32 real

terraform init
terraform validate
terraform plan
terraform apply
terraform destroy   # al terminar, para evitar costos
```

## Outputs esperados

- `vpc_id`
- `subnet_ids`
- `ssh_security_group_id`
