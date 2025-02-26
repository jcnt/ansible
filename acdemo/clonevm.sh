#!/bin/sh
source /home/jacint/.vcps

for i in `seq -w 10`; do 
    ansible-playbook -e password=$PS -e ds=jj-acdemo \
        -e vmname=win-$i ~/ansible/vmware/clone-win-vm.yaml
done
