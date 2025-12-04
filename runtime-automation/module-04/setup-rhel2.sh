#!/bin/sh

dnf downgrade -y polkit
dnf install -y libvpx-1.14.1-2.el10
insights-client
