#!/bin/bash

source /home/jacint/.vcps

ansible-playbook /home/jacint/ansible/vmware/vminfo.yaml --extra-vars "password=$PS"


