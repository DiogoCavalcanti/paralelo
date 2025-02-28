FROM jenkins/jenkins:2.492.1-jdk17

USER root

# Atualiza pacotes e instala dependências do Docker CLI
RUN apt-get update && apt-get install -y lsb-release curl

# Adiciona chave GPG e repositório do Docker
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# Instala Docker CLI
RUN apt-get update && apt-get install -y docker-ce-cli

# Ajusta permissões para o usuário Jenkins acessar o Docker
RUN groupadd docker && usermod -aG docker jenkins

# Instala plugins do Jenkins
RUN jenkins-plugin-cli --plugins blueocean docker-workflow

USER jenkins
