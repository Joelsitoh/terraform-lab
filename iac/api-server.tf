resource "docker_image" "node" {
  name         = "node:alpine"
  keep_locally = true
}

resource "docker_container" "api" {
  name    = "api-${terraform.workspace}"
  image   = docker_image.node.image_id
  command = ["node", "-e", "require('http').createServer((q,s)=>s.end('api')).listen(3000)"]

  networks_advanced {
    name = docker_network.red.name
  }

  ports {
    internal = 3000
    external = var.api_port[terraform.workspace]
  }
}