## Installation needed for both VMs: 
   - openssh-server

## Pre-requisitions
- Network setup applies to both the master and the slave target hosts:
    - IPs can be should be changed in the hosts.ini file to match your environment (Make sure to change the variables as well, master variable is being used in the playbook) 
    - Has Default Gateway

- Other Dependencies:
    - Target VMs are expected to be systemd initialized. 
    - User to be used by Ansible should be mentioned in hosts.ini
    - "shell" is being used in the Ansible playbooks, make sure to have bash 
    - Hostnames - Master k3s must contain "master" in the hostname, and the slave VM's hostname must contain "slave"