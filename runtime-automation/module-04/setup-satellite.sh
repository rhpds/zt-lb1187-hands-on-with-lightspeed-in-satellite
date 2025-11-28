#!/bin/bash
cd /root

# ansible-playbook config.yml

export regscript=$(hammer host-registration generate-command --activation-key RHEL10 --setup-insights 1 --insecure 1 --force 1)
ssh -o "StrictHostKeyChecking no" root@rhel1 $regscript

export regscript=$(hammer host-registration generate-command --activation-key RHEL10 --setup-insights 1 --insecure 1 --force 1)
ssh -o "StrictHostKeyChecking no" root@rhel2 $regscript

ssh -o "StrictHostKeyChecking no" root@rhel2 "dnf install -y libvpx-1.14.1-2.el10"