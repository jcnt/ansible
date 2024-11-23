#!/bin/bash

source /home/jacint/.vcps

ansible-playbook /home/jacint/ansible/vmware/getvms.yaml -e "vmname=$vmname" -e "password=$PS"



