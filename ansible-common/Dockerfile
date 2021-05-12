from centos:7

USER root

RUN echo "root:root" | chpasswd && \
    yum -y update && \
    yum -y install epel-release && \
    yum -y install sudo openssh-clients && \
    yum -y clean all

RUN useradd -m -s /bin/bash -u 2000 ansible && \
    echo "ansible:ansible" | chpasswd