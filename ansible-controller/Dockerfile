FROM ansible-common

USER root

RUN yum -y install ansible && \
    yum -y clean all

COPY ansible_hosts /etc/ansible/hosts
COPY ssh_config /etc/ssh/ssh_config

COPY run_playbook.sh /

RUN chmod 755 /run_playbook.sh && \
    chown ansible:ansible /run_playbook.sh

USER ansible

RUN ssh-keygen -q -t rsa -N "" -f $HOME/.ssh/id_rsa