Estructura del proyecto:

root@Infra:~/terraform-labs/terraform-docker# tree
.
|-- Dockerfile-bckp
|-- README.md
|-- Trabajo_Practico.md
|-- ansible
|   |-- ansible.cfg
|   |-- inventory.ini
|   `-- playbooks
|       `-- site.yml
|-- docker
|   |-- infra
|   |   `-- Dockerfile
|   `-- node
|-- scritps
`-- terraform
    |-- main.tf
    |-- outputs.tf
    |-- providers.tf
    |-- terraform.tfstate
    |-- terraform.tfstate.backup
    `-- variables.tf

8 directories, 13 files
root@Infra:~/terraform-labs/terraform-docker#


Secuencia de ejecuacion:

terraform apply
       │
       ▼
Crea la red Docker
       │
       ▼
Construye la imagen
       │
       ▼
Crea infra
       │
       ▼
Crea node1
       │
       ▼
Crea node2
       │
       ▼
Crea node3

Tener en cuenta que:

ssh-keygen

↓

copiar id_ed25519.pub

↓

crear ~/.ssh

↓

authorized_keys

↓

chmod

↓

ansible ping
ansible hostname, uptime, ip a



form 
Cuando trabajamos con Terraform de manera profesional en la industria, no escribimos todo en un único archivo gigante. En su lugar, dividimos el código en archivos especializados para maximizar la legibilidad, mantenibilidad y modularidad:

## providers.tf 
Configura los requerimientos de la versión de Terraform y declara los proveedores (plugins) necesarios para comunicarse con las APIs del exterior (AWS, GCP, Docker, etc.). Separa el cómo nos conectamos de la infraestructura en sí.

## variables.tf
Declara las variables de entrada que el proyecto aceptará. Funciona como el "plano estructural" y los parámetros de configuración parametrizables, evitando escribir valores fijos (hardcoded) en el código.

## terraform.tfvars
Contiene las asignaciones de valores reales para las variables definidas en variables.tf. Nunca se debe subir a Git si contiene secretos o claves de acceso.

## main.tf
Es el núcleo operativo de nuestro despliegue. Aquí se declaran los recursos reales (máquinas virtuales, firewalls, redes, contenedores) que se van a construir.

## outputs.tf
Define la información que Terraform imprimirá en pantalla al terminar con éxito el aprovisionamiento de recursos. Se usa para extraer IPs públicas, URIs de bases de datos o IDs de recursos útiles para el usuario o para canalizaciones de CI/CD.
