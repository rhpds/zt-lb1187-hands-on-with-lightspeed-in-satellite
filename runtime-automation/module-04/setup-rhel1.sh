#!/bin/sh
echo "Starting module called 01" >> /tmp/progress.log

dnf downgrade -y polkit
# dnf install -y libvpx-1.14.1-2.el10