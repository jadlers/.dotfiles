#!/bin/bash

# List packages to update and then try to update with apt upgrade
apt list --upgradable
sudo apt upgrade
echo ""
read -p "Press any key to close..." -n 1 -s
