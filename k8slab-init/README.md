### sample playbooks for upgrading my lab cluster. 

#### requirements: 
- auth setup with ssh keys
- sudo w/o password


#### contents: 

- init-k8s.yaml
networking and sysctl related settings

- init-containerd.yaml
install + config containerd

- init-kubeadm.yaml
install kubeadm kubelet kubectl

