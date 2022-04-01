from centos:7

USER root

# Install basics
RUN echo "root:root" | chpasswd && \
    yum -y update && \
    yum -y install epel-release && \
    yum -y install sudo openssh-clients openssh-server && \
    yum -y clean all

# Install tooling
RUN yum -y install sudo which nano curl && \
    yum -y clean all

# Create ansible user
RUN useradd -ms /bin/bash ansible && \
    echo "ansible:ansible" | chpasswd && \
    echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/ansible

# Listen to ssh traffic
CMD /sbin/init systemctl start sshd