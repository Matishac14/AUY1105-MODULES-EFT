# Módulo Terraform — ec2

Módulo que provisiona una **instancia EC2** en AWS dentro de una subnet y con los security groups que se le indiquen.

## Recursos

- `aws_instance`

## Variables (inputs)

| Nombre | Tipo | Default | Requerido | Descripción |
|---|---|---|---|---|
| `project_name` | `string` | — | Sí | Prefijo de nombre de los recursos. |
| `environment` | `string` | — | Sí | Entorno (`dev`, `qa`, `prod`). |
| `subnet_id` | `string` | — | Sí | ID de la subnet (típicamente pública). |
| `security_group_ids` | `list(string)` | — | Sí | IDs de security groups a asociar. |
| `ami_id` | `string` | `ami-0ec10929233384c7f` | No | AMI (Ubuntu `us-east-1` por defecto). |
| `instance_type` | `string` | `t2.micro` | No | Tipo de instancia. |
| `key_name` | `string` | `vockey` | No | Key pair para SSH. |

## Outputs

| Nombre | Descripción |
|---|---|
| `instance_id` | ID de la instancia EC2. |
| `instance_ip` | IP pública (si aplica). |

## Dependencias

- Terraform `>= 1.5.0`
- Proveedor `hashicorp/aws` `>= 6.0, < 7.0`
- **Una VPC con al menos una subnet** y un **security group** ya creados. Se recomienda usar el módulo `vpc` de este mismo repositorio.

## Uso

```hcl
module "vpc" {
  source           = "git::https://github.com/AUY1105-II/Modulos-AUY1105-Grupo-4.git//modules/vpc?ref=v0.2.0"
  project_name     = "eft-auy1105-project"
  environment      = "dev"
  allowed_ssh_cidr = "203.0.113.10/32"
}

module "ec2" {
  source             = "git::https://github.com/AUY1105-II/Modulos-AUY1105-Grupo-4.git//modules/ec2?ref=v0.2.0"
  project_name       = "eft-auy1105-project"
  environment        = "dev"
  subnet_id          = module.vpc.subnet_ids[0]
  security_group_ids = [module.vpc.ssh_security_group_id]
}
```

Ejemplo ejecutable en [`examples/`](./examples).
