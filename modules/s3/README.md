# Módulo Terraform — s3

Módulo que provisiona un **bucket S3** en AWS con un nombre y tags básicos.

## Recursos

- `aws_s3_bucket`

## Variables (inputs)

| Nombre | Tipo | Default | Requerido | Descripción |
|---|---|---|---|---|
| `bucket_name` | `string` | — | Sí | Nombre único global del bucket. |
| `environment` | `string` | — | Sí | Entorno (tag). |

## Outputs

| Nombre | Descripción |
|---|---|
| `bucket_name` | Nombre del bucket S3 creado. |

## Dependencias

- Terraform `>= 1.5.0`
- Proveedor `hashicorp/aws` `>= 6.0, < 7.0`

## Uso

```hcl
module "s3" {
  source = "git::https://github.com/AUY1105-II/Modulos-AUY1105-Grupo-4.git//modules/s3?ref=v0.3.0"

  bucket_name = "auy1105-grupo4-eft-auy1105-project-dev-bucket"
  environment = "dev"
}
```

Ejemplo ejecutable en [`examples/`](./examples).
