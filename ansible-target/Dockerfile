FROM centos:7

USER root

# Install packages
RUN yum -y update && \
    yum -y install openssh-clients openssh-server && \
    yum -y clean all

# Set up root acess via SSH
RUN echo "root:root" | chpasswd && \
    ssh-keygen -A

EXPOSE 22

CMD /sbin/init systemctl start sshd
    