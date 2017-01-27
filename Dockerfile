FROM jenkins:2.32.1

MAINTAINER Kor de Jong <k.dejong1@uu.nl>

USER root
RUN \
    apt-get update && \
    apt-get upgrade && \
    apt-get install -y \
        apt-transport-https \
        ca-certificates \
        git-core \
        software-properties-common \
        sudo && \
    echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers && \
    rm -fr /var/lib/apt/lists/*

USER jenkins
# https://plugins.jenkins.io/
RUN /usr/local/bin/install-plugins.sh \
    blueocean

# Mark this installation as fully configured.
# TODO Doesn't work...
# RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
