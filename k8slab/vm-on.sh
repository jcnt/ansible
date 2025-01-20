#!/bin/bash

source /home/jacint/.vcps

if [[ $# -eq 0 ]]
    then echo paramter: hostname
else
    ansible-playbook /home/jacint/ansible/vmware/poweron.yaml --extra-vars "vmname=$1 password=$PS"
fi

