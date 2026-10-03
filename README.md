# Terraform Hands-on Lab

Infraestructura con Terraform y Docker para los ambientes DEV y QA.

| Servicio | DEV | QA |
|---|---|---|
| web (nginx) | 4001:80 | 5001:80 |
| api (node) | 4002:3000 | 5002:3000 |
| bd (postgresql) | 4003:5432 | 5003:5432 |

## Requisitos

- Git
- Docker Desktop (en ejecución)
- Terraform

## Instrucciones

1. Clonar el repositorio:

```bash
git clone https://github.com/Joelsitoh/terraform-lab.git
cd terraform-lab/iac
```

2. Inicializar Terraform:

```bash
terraform init
```

3. Crear el ambiente DEV:

```bash
terraform workspace new dev
terraform apply -auto-approve
```

4. Crear el ambiente QA:

```bash
terraform workspace new qa
terraform apply -auto-approve
```

5. Verificar los contenedores:

```bash
docker ps
```

- Web DEV: http://localhost:4001
- API DEV: http://localhost:4002
- Web QA: http://localhost:5001
- API QA: http://localhost:5002

6. Eliminar un ambiente:

```bash
terraform workspace select dev
terraform destroy -auto-approve
```