# Módulo Terraform — vpc

Módulo que provisiona una **VPC** en AWS con subnets públicas y privadas distribuidas en varias Availability Zones, un Internet Gateway, una route table pública y un security group para acceso SSH desde un CIDR autorizado.

## Recursos

- `aws_vpc`
- `aws_internet_gateway`
- `aws_subnet` (públicas y privadas, según las listas de CIDRs)
- `aws_route_table` + `aws_route_table_association` (públicas)
- `aws_security_group` (SSH)

## Variables (inputs)

| Nombre | Tipo | Default | Requerido | Descripción |
|---|---|---|---|---|
| `project_name` | `string` | — | Sí | Prefijo de nombre de los recursos. |
| `environment` | `string` | — | Sí | Entorno (`dev`, `qa`, `prod`). |
| `cidr_block` | `string` | `10.1.0.0/16` | No | CIDR principal de la VPC. |
| `availability_zones` | `list(string)` | 3 AZs de `us-east-1` | No | AZs para las subnets. |
| `public_subnet_cidrs` | `list(string)` | 3 CIDRs `/24` | No | CIDRs de subnets públicas. |
| `private_subnet_cidrs` | `list(string)` | 3 CIDRs `/24` | No | CIDRs de subnets privadas. |
| `allowed_ssh_cidr` | `string` | — | Sí | CIDR autorizado para SSH (22). |

## Outputs

| Nombre | Descripción |
|---|---|
| `vpc_id` | ID de la VPC. |
| `subnet_ids` | IDs de todas las subnets (públicas + privadas). |
| `ssh_security_group_id` | ID del SG SSH, para el módulo `ec2`. |

## Dependencias

- Terraform `>= 1.5.0`
- Proveedor `hashicorp/aws` `>= 6.0, < 7.0`
- Credenciales AWS configuradas en el root module.

## Uso

```hcl
module "vpc" {
  source = "git::https://github.com/AUY1105-II/Modulos-AUY1105-Grupo-4.git//modules/vpc?ref=v0.1.0"

  project_name     = "eft-auy1105-project"
  environment      = "dev"
  allowed_ssh_cidr = "203.0.113.10/32"
}
```

Ejemplo ejecutable en [`examples/`](./examples).
