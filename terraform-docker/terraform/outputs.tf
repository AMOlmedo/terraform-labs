output "containers" {
  value = [
    docker_container.infra.name,
    docker_container.node1.name,
    docker_container.node2.name,
    docker_container.node3.name
  ]
}
