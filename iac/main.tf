terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}


resource "docker_network" "red" {
  name = "red-${terraform.workspace}"
}