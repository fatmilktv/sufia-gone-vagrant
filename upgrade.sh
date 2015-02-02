#!/usr/bin/env bash

echo "Upgrading..."
yum makecache fast
yum -y upgrade
echo "Done!"
