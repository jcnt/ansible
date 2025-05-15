#!/bin/sh
source /home/jacint/.fatoken

ansible-playbook -e token=$X70A -e volname=jjans::jjans \
    ~/ansible/fa/ac-pod-vol.yaml
