from centos:7

USER root

RUN yum -y update && \
    yum -y install epel-release && \
    yum -y install openssh-clients ansible && \
    yum -y clean all

COPY ansible_hosts /etc/ansible/hosts
COPY ssh_config /etc/ssh/ssh_config

COPY run_playbook.sh /
RUN chmod 755 /run_playbook.sh

RUN ssh-keygen -q -t rsa -N "" -f $HOME/.ssh/id_rsa

ENTRYPOINT sshpass -p "root" ssh-copy-id -i $HOME/.ssh/id_rsa root@ansible-target && \
    tail -f /dev/null