#!/bin/bash
echo -e "Updating system with pacman and aurget...\n"
sudo pacman -Syu
echo
sudo aurget -Syu
