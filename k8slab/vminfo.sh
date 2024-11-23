#!/bin/bash

source /home/jacint/.vcps

if [[ $# -eq 0 ]]
    then echo paramter: cluster[1..3]
else
    if [[ $1 == cluster1 ]]
        then 
            vmname=jjmaster
    
    elif [[ $1 == cluster2 ]]
        then 
    	    vmname=jjmastdr
    
    elif [[ $1 == cluster3 ]]
        then 
    	    vmname=jjmast3r
    
    elif [[ $1 == clusterbk ]]
        then 
    	    vmname=jjpxbkm
    fi

    ansible-playbook /home/jacint/ansible/vmware/vminfo.yaml -e "vmname=$vmname" -e "password=$PS"
fi



