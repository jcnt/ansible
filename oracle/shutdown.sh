#!/bin/bash

source /home/jacint/.vcps

ansible-playbook poweroff.yaml --extra-vars "password=$PS"

