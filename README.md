# Terraform Hands-on Lab

En este laboratorio utilicé Terraform con el proveedor de Docker para desplegar dos ambientes, DEV y QA, cada uno con un frontend, un backend y una base de datos PostgreSQL.

## Stack

- **Frontend:** nginx, sirve el `index.html` por defecto en el puerto 80.
- **Backend:** node, responde un mensaje en el puerto 3000.
- **BD:** PostgreSQL en el puerto 5432.

| Servicio | DEV | QA |
|---|---|---|
| web (nginx) | web-dev 4001:80 | web-qa 5001:80 |
| api (node) | api-dev 4002:3000 | api-qa 5002:3000 |
| bd (postgresql) | bd-dev 4003:5432 | bd-qa 5003:5432 |

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

Para eliminar QA, reemplazar `dev` por `qa`.

## Conventional Commits

Los cambios se registraron con el formato `tipo: descripción`. El historial se puede consultar con:

```bash
git log --oneline
```

## Créditos

- Joel Francisco Mariñas Rios