#!/bin/sh
source /home/jacint/.fatoken

ansible-playbook -e x70atoken=$X70A -e x70btoken=$X70B\
    -e volname=jjans::jjans ~/ansible/fa/ac-pod-vol.yaml
