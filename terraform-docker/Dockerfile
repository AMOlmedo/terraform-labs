FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    openssh-server \
    python3 \
    sudo \
    iputils-ping

RUN mkdir /var/run/sshd

# 🔑 habilitar root login por SSH
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

# 🔑 (opcional pero útil) habilitar password login
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

# 🔑 setear password root (esto es lo que te faltaba)
RUN echo "root:root" | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
