FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        openssh-server \
        python3 \
        sudo \
        iputils-ping \
        net-tools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Crear usuario ansible
RUN useradd -m -s /bin/bash ansible

# Permitir sudo sin contraseña
RUN echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible && \
    chmod 440 /etc/sudoers.d/ansible

# Preparar SSH
RUN mkdir /var/run/sshd && \
    mkdir -p /home/ansible/.ssh && \
    chmod 700 /home/ansible/.ssh && \
    chown -R ansible:ansible /home/ansible/.ssh

# Configuración SSH
# PermitRootLogin no --> no permir login con root
# PasswordAuthentication no --> solo se puede acceder con claves SSH


RUN sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config && \
    echo "PermitRootLogin no" >> /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D", "-e"]
