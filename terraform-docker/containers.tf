resource "docker_container" "infra" {

  name     = "infra"
  hostname = "infra-docker"

  image = docker_image.infra.image_id

  networks_advanced {
    name = docker_network.ansible_net.name
  }
}

resource "docker_container" "node1" {

  name     = "node1"
  hostname = "node1"

  image = docker_image.node.image_id

  networks_advanced {
    name = docker_network.ansible_net.name
  }
}

resource "docker_container" "node2" {

  name     = "node2"
  hostname = "node2"

  image = docker_image.node.image_id

  networks_advanced {
    name = docker_network.ansible_net.name
  }
}

resource "docker_container" "node3" {

  name     = "node3"
  hostname = "node3"

  image = docker_image.node.image_id

  networks_advanced {
    name = docker_network.ansible_net.name
  }
}
