### sample playbooks for upgrading my lab cluster. 

#### requirements: 
- auth setup with ssh keys
- sudo w/o password
- kubectl to run on worker nodes


#### contents: 

- k8s-master.yaml  
single master node  

- k8s-workers.yaml  
worker nodes executed as rolling upgrade  

- k8s-ansible-upgrade-29.2-29.3.log 
example log of an executed upgrade.  
sample deployment and node list at the end  



