#!/usr/bin/env bash

echo "Upgrading..."
yum makecache fast # this per debug logs
yum -y clean all
yum -y update
reboot
echo "Done!"
