from centos:7

USER root

RUN echo "root:root" | chpasswd && \
    yum -y update && \
    yum -y install epel-release && \
    yum -y install sudo openssh-clients && \
    yum -y clean all

RUN useradd -ms /bin/bash ansible && \
    echo "ansible:ansible" | chpasswd