#!/bin/bash

source /home/jacint/.vcps

if [[ $# -eq 0 ]]
    then echo paramter: cluster[1..5]
else
    for i in `cat $1`; 
        do ansible-playbook /home/jacint/ansible/vmware/delete-vm.yaml --extra-vars "vmname=$i password=$PS"; 
    done
fi


