#!/bin/bash

source /home/jacint/.vcps

if [[ $# -eq 0 ]]
    then echo paramter: cluster[1..5]
else
    if [[ $1 == cluster1 ]]
        then 
            vmname=jj-m1
    
    elif [[ $1 == cluster2 ]]
        then 
    	    vmname=jj-m2
    
    elif [[ $1 == cluster3 ]]
        then 
    	    vmname=jj-m3
    
    elif [[ $1 == cluster4 ]]
        then 
    	    vmname=jj-m4
    
    elif [[ $1 == cluster5 ]]
        then 
    	    vmname=jj-m5
    
    elif [[ $1 == clusterbk ]]
        then 
    	    vmname=jjpxbkm
    fi

    ansible-playbook /home/jacint/ansible/vmware/vminfo.yaml -e "vmname=$vmname" -e "password=$PS"
fi



