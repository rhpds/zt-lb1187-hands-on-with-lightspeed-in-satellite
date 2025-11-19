#!/bin/bash

cd /root

tee ~/config.yml << EOF
---
- name: Configure Satellite 6.18
  hosts: localhost
  remote_user: root

  tasks:
  - name: "Create an activation key."
    redhat.satellite.activation_key:
      username: "admin"
      password: "bc31c9a6-9ff0-11ec-9587-00155d1b0702"
      server_url: "https://satellite.lab"
      name: "RHEL10"
      content_view: "Default Organization View"
      organization: "Acme Org"
      lifecycle_environment: "Library"
      content_overrides:
          - label: satellite-client-6-for-rhel-10-x86_64-rpms
            override: enabled
EOF

ansible-playbook config.yml

export regscript=$(hammer host-registration generate-command --activation-key RHEL10 --setup-insights 0 --insecure 1 --force 1)
ssh -o "StrictHostKeyChecking no" root@rhel1 $regscript

export regscript=$(hammer host-registration generate-command --activation-key RHEL10 --setup-insights 0 --insecure 1 --force 1)
ssh -o "StrictHostKeyChecking no" root@rhel2 $regscript