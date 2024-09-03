#!/usr/bin/env bash
######################################################
# Desc: setup script for containers to behave as server with ssh connection
# Created by: silent-mobius aka Alex M. Schapelle
# Update: script converted to be matchable to rpm and deb based systems
# version: 1.1.0


set -x
. /etc/os-release 

: ${SSH_USERNAME:=user}
: ${SSH_USERPASS:=user}


function main(){
    create_rundir
    create_hostkeys
    sed -i 's/\#Pubkey/Pubkey/g' /etc/ssh/sshd_config
    create_user
    copy_ssh_key
    setup_sudo
}


function create_rundir() {
    if [[ $ID == 'debian' ]];then
	    mkdir -p /var/run/sshd
    else
        mkdir -p /run/sshd
    fi
}

function create_user() {
    # Create a user to SSH into as.
    useradd -m -s /bin/bash $SSH_USERNAME
    if [[ "$ID" == 'debian' ]];then
        (echo $SSH_USERPASS ;echo $SSH_USERPASS )| passwd  $SSH_USERNAME 
    else
        echo -e "$SSH_USERPASS" | passwd  $SSH_USERNAME --stdin
    fi
    echo ssh user password: $SSH_USERPASS
}

function setup_sudo(){
    if [[ $ID == 'debian' ]];then
        if grep -q NOPASSWD /etc/sudoers;then
            sed -i 's/# %sudo	ALL=(ALL)	NOPASSWD: ALL/%sudo	ALL=(ALL)	NOPASSWD: ALL/g' /etc/sudoers
        else
            echo '%sudo	ALL=(ALL)	NOPASSWD: ALL' >> /etc/sudoers
        fi
    else
        if grep -q NOPASSWD /etc/sudoers;then
            sed -i 's/# %wheel	ALL=(ALL)	NOPASSWD: ALL/%wheel	ALL=(ALL)	NOPASSWD: ALL/g' /etc/sudoers
        else
            echo '%wheel	ALL=(ALL)	NOPASSWD: ALL' >> /etc/sudoers
        fi
    fi
    if [[ $ID == 'debian' ]];then
        usermod -aG sudo $SSH_USERNAME
    else
        usermod -aG wheel $SSH_USERNAME
    fi
}

function create_hostkeys() {
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 
}

function copy_ssh_key() {
    if [[ ! -d "/home/$SSH_USERNAME/.ssh" ]];then
        mkdir -p "/home/$SSH_USERNAME/.ssh"
    fi
        cp /root/.ssh/authorized_keys "/home/$SSH_USERNAME/.ssh/authorized_keys"
        chown 1000:1000 -R /home/$SSH_USERNAME/.ssh
        chmod  600 "/home/$SSH_USERNAME/.ssh/authorized_keys"
}

######################
# Call all functions
######################
main 
echo calling "$@"
exec "$@"
