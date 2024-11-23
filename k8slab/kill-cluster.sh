#!/bin/bash

source /home/jacint/.vcps


if [[ $# -eq 0 ]]
    then echo paramter: cluster[1..3]
else
    if [[ $1 == cluster1 ]]
        then 
            master=jjmaster
            w1=jjkw11
            w2=jjkw12
            w3=jjkw13
            w4=jjkw14
    
    elif [[ $1 == cluster2 ]]
        then 
            master=jjmastdr
            w1=jjkw21
            w2=jjkw22
            w3=jjkw23
            w4=jjkw24
    
    elif [[ $1 == cluster3 ]]
        then 
            master=jjmast3r
            w1=jjkw31
            w2=jjkw32
            w3=jjkw33
            w4=jjkw34
    fi

    ansible-playbook /home/jacint/ansible/vmware/poweroff-force.yaml -e "master=$master" -e "w1=$w1" -e "w2=$w2" -e "w3=$w3" -e "w4=$w4" -e "password=$PS"

fi
