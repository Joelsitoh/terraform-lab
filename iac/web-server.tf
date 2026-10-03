resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "web" {
  name  = "web-${terraform.workspace}"
  image = docker_image.nginx.image_id

  networks_advanced {
    name = docker_network.red.name
  }

  ports {
    internal = 80
    external = var.web_port[terraform.workspace]
  }
}