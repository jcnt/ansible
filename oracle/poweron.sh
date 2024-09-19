#!/bin/bash

source /home/jacint/.vcps

ansible-playbook poweron.yaml --extra-vars "password=$PS"

