# Módulos Terraform — AUY1105 Grupo 4

Repositorio de módulos Terraform reutilizables para la **Evaluación Parcial 2** del curso AUY1105 — Infraestructura como Código II.

Cada módulo está pensado para ser consumido desde el repositorio principal [`AUY1105-Grupo-4`](https://github.com/AUY1105-II/AUY1105-Grupo-4) (u otros consumidores) referenciándolo por tag de release.

## Módulos disponibles

| Módulo | Recursos | Outputs principales |
|---|---|---|
| [`modules/vpc`](./modules/vpc) | VPC, subnets públicas/privadas, IGW, route table, security group SSH | `vpc_id`, `subnet_ids`, `ssh_security_group_id` |
| [`modules/ec2`](./modules/ec2) | Instancia EC2 `t2.micro` | `instance_id`, `instance_ip` |
| [`modules/s3`](./modules/s3) | Bucket S3 | `bucket_name` |

## Consumo desde otro repositorio

```hcl
module "vpc" {
  source           = "git::https://github.com/AUY1105-II/Modulos-AUY1105-Grupo-4.git//modules/vpc?ref=v1.0.0"
  project_name     = "eft-auy1105-project"
  environment      = "dev"
  allowed_ssh_cidr = "203.0.113.10/32"
}

module "ec2" {
  source             = "git::https://github.com/AUY1105-II/Modulos-AUY1105-Grupo-4.git//modules/ec2?ref=v1.0.0"
  project_name       = "eft-auy1105-project"
  environment        = "dev"
  subnet_id          = module.vpc.subnet_ids[0]
  security_group_ids = [module.vpc.ssh_security_group_id]
}

module "s3" {
  source      = "git::https://github.com/AUY1105-II/Modulos-AUY1105-Grupo-4.git//modules/s3?ref=v1.0.0"
  bucket_name = "auy1105-grupo4-eft-auy1105-project-dev-bucket"
  environment = "dev"
}
```

> El sufijo `//modules/<nombre>` indica el subdirectorio dentro del repositorio.
> El parámetro `?ref=v1.0.0` fija el tag publicado por release-please.

## Versionado

Versionado semántico (`MAJOR.MINOR.PATCH`) gestionado automáticamente por la GitHub Action **release-please** (Google).

- `feat:` → bump MINOR
- `fix:` → bump PATCH
- `feat!:` o `BREAKING CHANGE:` → bump MAJOR
- `chore:`, `docs:`, `refactor:` → no generan release

El archivo `CHANGELOG.md` y los tags/releases en GitHub se generan automáticamente al mergear el PR que abre release-please. **No editar manualmente.**

## Estructura

```
.
├── .github/workflows/release-please.yml
├── .release-please-manifest.json
├── release-please-config.json
└── modules/
    ├── vpc/
    ├── ec2/
    └── s3/
```

Cada módulo contiene:

```
modules/<nombre>/
├── main.tf
├── variables.tf
├── outputs.tf
├── versions.tf
├── README.md
└── examples/
    ├── main.tf
    └── README.md
```

## Versión estable

Esta es la primera versión estable (`v1.0.0`) lista para producción.
