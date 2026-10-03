resource "docker_image" "postgres" {
  name         = "postgres:alpine"
  keep_locally = true
}

resource "docker_container" "bd" {
  name  = "bd-${terraform.workspace}"
  image = docker_image.postgres.image_id
  env   = ["POSTGRES_PASSWORD=postgres"]

  networks_advanced {
    name = docker_network.red.name
  }

  ports {
    internal = 5432
    external = var.bd_port[terraform.workspace]
  }
}