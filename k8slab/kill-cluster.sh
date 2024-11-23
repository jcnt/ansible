#!/bin/bash

source /home/jacint/.vcps

if [[ $# -eq 0 ]]
    then echo paramter: cluster[1,2,3]
else
    for i in `cat $1`; do ansible-playbook -f 30 /home/jacint/ansible/vmware/poweroff-force.yaml --extra-vars "vmname=$i password=$PS"; done
fi

