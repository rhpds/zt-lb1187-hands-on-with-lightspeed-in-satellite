#!/bin/bash
systemctl stop dnf-automatic-install.timer
systemctl disable dnf-automatic-install.timer
systemctl mask dnf-automatic-install.timer
