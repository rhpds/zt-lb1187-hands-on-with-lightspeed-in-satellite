#!/bin/sh
echo "Starting module called 01" >> /tmp/progress.log

export regscript=$(hammer host-registration generate-command --activation-key RHEL10 --setup-insights 1 --insecure 1 --force 1)
ssh -o "StrictHostKeyChecking no" root@rhel2 $regscript