output "nodes" {
  description = "IPs de todos los nodos administrados por Ansible"

  value = {
    infra = docker_container.infra.network_data[0].ip_address
    node1 = docker_container.node1.network_data[0].ip_address
    node2 = docker_container.node2.network_data[0].ip_address
    node3 = docker_container.node3.network_data[0].ip_address
  }
}
