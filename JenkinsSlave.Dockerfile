FROM ubuntu:18.04
USER root

RUN useradd -ms /bin/bash jenkins

RUN apt-get update -qq

RUN apt-get update && \
    apt-get -y install apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
      $(lsb_release -cs) \
      stable" && \
   apt-get update && \
   apt-get -y install docker-ce

RUN usermod -aG docker jenkins

RUN apt-get install openjdk-8-jdk -qq \
    && apt-get install openssh-server -qq

RUN mkdir -p jenkins_home \
    && chmod 777 jenkins_home

USER jenkins
WORKDIR /jenkins_home
CMD ["/bin/bash"]