FROM jenkins/jenkins:lts

USER root

# Install docker client
RUN apt-get update && apt-get install -y \
  curl \
  && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://get.docker.com/ | sh
RUN usermod -aG docker jenkins

RUN mkdir /mnt/notebook

COPY ./run-notebook.sh /usr/local/sbin/
RUN chmod +x /usr/local/sbin/run-notebook.sh

USER ${user}
