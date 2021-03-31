from centos:7

USER root

RUN yum -y update && \
    yum -y install epel-release && \
    yum -y install openssh-clients ansible && \
    yum -y clean all

COPY ansible_hosts /etc/ansible/hosts
COPY ssh_config /etc/ssh/ssh_config

COPY run_playbook.sh /

RUN useradd -m -s /bin/bash -u 2000 ansible && \
    echo "ansible:ansible" | chpasswd && \
    chmod 755 /run_playbook.sh && \
    chown ansible:ansible /run_playbook.sh

USER ansible

RUN ssh-keygen -q -t rsa -N "" -f $HOME/.ssh/id_rsa

ENTRYPOINT sshpass -p ansible ssh-copy-id -i $HOME/.ssh/id_rsa ansible@ansible-target && \
    tail -f /dev/null