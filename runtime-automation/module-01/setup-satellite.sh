#!/bin/sh
echo "Starting module called 01" >> /tmp/progress.log

export regscript=$(hammer host-registration generate-command --activation-key RHEL10 --setup-insights 1 --insecure 1 --force 1)
ssh -o "StrictHostKeyChecking no" root@rhel-${GUID}-2 $regscript

ssh -o "StrictHostKeyChecking no" root@rhel-${GUID}-2 dnf downgrade -y polkit
ssh -o "StrictHostKeyChecking no" root@rhel-${GUID}-2 dnf install -y libvpx-1.14.1-2.el10
ssh -o "StrictHostKeyChecking no" root@rhel-${GUID}-2 insights-client