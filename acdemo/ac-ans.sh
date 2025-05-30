#!/bin/sh
source /home/jacint/.fatoken

ansible-playbook -e x70atoken=$X70A -e x70btoken=$X70B\
    -e volname=jj-ans::jj-ans ~/ansible/fa/ac-pod-vol.yaml
