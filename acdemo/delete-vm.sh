#!/bin/sh
source /home/jacint/.vcps

for i in `seq -w 10`; do 
    ansible-playbook -e password=$PS -e vmname=win-$i ~/ansible/vmware/delete-vm.yaml
done
