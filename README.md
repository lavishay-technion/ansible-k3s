# Ansible Task

## Pre-requisitions
- Network setup as follows:
    * Master: 
        - Has a default gateway(Doesn't matter which)
        - The interface connected to the LAN with the node will have the IP of : 192.168.1.2/24
    * Node:
        - Has a default gateway in the same interface connected to the LAN with the master(With routing of that network address)
        - The interface connected to the LAN with the node will have the IP of : 192.168.1.3/24





Install K3s master and slave nodes based on [get.k3s.io](https://get.k3s.io) install script

### Tasks:

- Create k3s install role that will install k3s offline - without downloading anything from internet, all the binaries need to be included in ansible role
- Create k3s agent role that will install k3s offline - without downloading anyting from the insternet, all the binaries need to be included in insible role.
- Create playbook that uses roles above
- Create python/bash/ruby/powershell/js script that will run the ansible playbook

#### Notes:

- K3s needs to be run before setting slaves/node/agents
- Read the install script carefully before running it.

