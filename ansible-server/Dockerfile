from centos:7

USER root

RUN yum -y update && \
    yum -y install epel-release && \
    yum -y install openssh-clients ansible && \
    yum -y clean all

COPY ansible_hosts /etc/ansible/hosts

RUN mkdir $HOME/playbooks
COPY httpd_playbook.yaml /root/playbooks/test

RUN ssh-keygen -q -t rsa -N "" -f $HOME/.ssh/id_rsa && \
    echo "StrictHostKeyChecking no" > $HOME/.ssh/config

ENTRYPOINT sshpass -p "root" ssh-copy-id -i $HOME/.ssh/id_rsa root@ansible-target >> $HOME/log && \
    tail -f /dev/null
# CMD ansible all -m ping