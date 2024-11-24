#!/bin/bash

source /home/jacint/.vcps

ansible-playbook /home/jacint/ansible/vmware/getvms.yaml -e "password=$PS" |egrep  '(guest_name|power_state)'
