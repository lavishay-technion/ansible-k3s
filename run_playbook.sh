#!/bin/bash


## Downloading needed files for the ansible playbook
curl -L -o ./00_copying_files/files/k3s https://github.com/k3s-io/k3s/releases/download/v1.30.5-rc1%2Bk3s1/k3s
curl -L -o ./00_copying_files/files/k3s-airgap-images-amd64.tar.zst https://github.com/k3s-io/k3s/releases/download/v1.30.5-rc1%2Bk3s1/k3s-airgap-images-amd64.tar.zst
curl -o ./00_copying_files/files/install.sh https://get.k3s.io/

ansible-playbook main_playbook.yaml