#!/bin/bash

source /home/jacint/.vcps


if [[ $# -eq 0 ]]
    then echo paramter: cluster[1..5]
else
    if [[ $1 == cluster1 ]]
        then 
            master=jj-m1
            w1=jj-w11
            w2=jj-w12
            w3=jj-w13
    
    elif [[ $1 == cluster2 ]]
        then 
            master=jj-m2
            w1=jjk-21
            w2=jjk-22
            w3=jjk-23
    
    elif [[ $1 == cluster3 ]]
        then 
            master=jj-m3
            w1=jj-w31
            w2=jj-w32
            w3=jj-w33

    elif [[ $1 == cluster4 ]]
        then 
            master=jj-m4
            w1=jj-w41
            w2=jj-w42
            w3=jj-w43
    
    elif [[ $1 == cluster5 ]]
        then 
            master=jj-m5
            w1=jj-w51
            w2=jj-w52
            w3=jj-w53
    fi

    ansible-playbook /home/jacint/ansible/vmware/poweroff-force.yaml -e "master=$master" -e "w1=$w1" -e "w2=$w2" -e "w3=$w3" -e "w4=$w4" -e "password=$PS"

fi
