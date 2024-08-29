#!/bin/bash
# 2024.08.25

####################################
###        SECURITY SCAN         ###
####################################

## Debsums
echo "Running debsums"
sudo debsums | grep -v OK



exit
