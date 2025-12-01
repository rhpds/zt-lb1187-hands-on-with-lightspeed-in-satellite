#!/bin/sh
echo "Starting module called 01" >> /tmp/progress.log

dnf downgrade -y polkit
