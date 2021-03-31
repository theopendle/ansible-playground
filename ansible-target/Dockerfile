FROM centos:7

USER root

# Install packages
RUN yum -y update && \
    yum -y install openssh-clients openssh-server python3 && \
    yum -y clean all

# Set up root acess via SSH
RUN echo "root:root" | chpasswd

EXPOSE 22 80 443

RUN useradd -ms /bin/bash ansible && \
    echo "ansible:ansible" | chpasswd && \
    mkdir /playbooks && \
    chown ansible:ansible /playbooks

CMD /sbin/init systemctl start sshd
    