FROM ansible-common

USER root

EXPOSE 22 80 443

RUN yum -y install sudo openssh-clients openssh-server && \
    yum -y clean all

RUN echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

CMD /sbin/init systemctl start sshd