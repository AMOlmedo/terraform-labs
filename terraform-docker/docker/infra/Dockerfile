FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    ansible-core \
    openssh-client \
    git \
    curl \
    vim \
    nano \
    tree \
    jq \
    iputils-ping \
    net-tools \
    python3 \
    locales \
 && rm -rf /var/lib/apt/lists/*

# Configurar locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Directorio de trabajo
WORKDIR /ansible

CMD ["sleep", "infinity"]
