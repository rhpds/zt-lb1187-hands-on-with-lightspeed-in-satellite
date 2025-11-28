#!/bin/bash
systemctl stop dnf-automatic-install.timer
systemctl disable dnf-automatic-install.timer
systemctl mask dnf-automatic-install.timer
dnf install -y libvpx-1.14.1-2.el10