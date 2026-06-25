resource "docker_image" "ubuntu" {
  name = "ubuntu:24.04"
}
resource "docker_network" "ansible_net" {
  name = "ansible-net"
}
resource "docker_container" "infra" {
  name  = "infra"
  image = docker_image.ubuntu.image_id
  command = ["sleep", "infinity"]

  networks_advanced {
    name = docker_network.ansible_net.name
  }
}
resource "docker_container" "node1" {
  name  = "node1"
  hostname = "node1"
  image = docker_image.ubuntu.image_id
  command = ["sleep", "infinity"]

  networks_advanced {
    name = docker_network.ansible_net.name
  }
}
resource "docker_container" "node2" {
  name  = "node2"
  hostname = "node2"
  image = docker_image.ubuntu.image_id
  command = ["sleep", "infinity"]

  networks_advanced {
    name = docker_network.ansible_net.name
  }
}
resource "docker_container" "node3" {
  name  = "node3"
  hostname = "node3"
  image = docker_image.ubuntu.image_id
  command = ["sleep", "infinity"]

  networks_advanced {
    name = docker_network.ansible_net.name
  }
}
