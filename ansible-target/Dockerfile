FROM centos:7

USER root

# Install packages
RUN yum -y update && \
    yum -y install sudo openssh-clients openssh-server && \
    yum -y clean all

# Set up root acess via SSH
RUN echo "root:root" | chpasswd

EXPOSE 22 80 443

RUN useradd -ms /bin/bash -u 2000 ansible && \
    echo "ansible:ansible" | chpasswd && \
    mkdir /playbooks && \
    chown ansible:ansible /playbooks && \
    echo "ansible  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

CMD /sbin/init systemctl start sshd