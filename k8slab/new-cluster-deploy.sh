#!/bin/bash
source /home/jacint/.vcps

if [[ $# -eq 0 ]]
    then echo paramter: [cluster[1..5] ] [version, e.g. 1.29.8]
    exit 1
fi

debver=`echo $2 | awk -F"." '{ print $1"."$2 }'`

if [[ $1 == cluster1 ]]
    then 
        master=m1
        workers="w11 w12 w13"
	    podcidr=10.77.1.0/24
	    svccidr=10.78.1.0/24

elif [[ $1 == cluster2 ]]
    then 
	    master=m2
        workers="w21 w22 w23"
	    podcidr=10.77.2.0/24
	    svccidr=10.78.2.0/24

elif [[ $1 == cluster3 ]]
    then 
	    master=m3
        workers="w31 w32 w33"
	    podcidr=10.77.3.0/24
	    svccidr=10.78.3.0/24

elif [[ $1 == cluster4 ]]
    then 
	    master=m4
        workers="w41 w42 w43"
	    podcidr=10.77.5.0/24
	    svccidr=10.78.5.0/24

elif [[ $1 == cluster5 ]]
    then 
	    master=m5
        workers="w51 w52 w53"
	    podcidr=10.77.6.0/24
	    svccidr=10.78.6.0/24

elif [[ $1 == clusterbk ]]
    then 
	    master=jjpxbkm
        workers="jjpxbk1 jjpxbk2 jjpxbk3"
	    podcidr=10.77.4.0/24
	    svccidr=10.78.4.0/24
fi

# cloning template to VMs 
for i in `cat $1`; 
    do ip=`grep $i /etc/hosts |awk '{print $1}'`;
    ansible-playbook /home/jacint/ansible/vmware/clone-vm.yaml -e "vmname=$i" -e "ipaddress=$ip" -e "password=$PS"; 
done

# poweron all VMs
for i in `cat $1`; 
    do ansible-playbook /home/jacint/ansible/vmware/poweron.yaml -e "vmname=$i" -e "password=$PS"; 
done

echo "sleeping for 30 sec, VMs coming up, re-IP, SSH re-key"
sleep 30

# finalize cluster nodes
for i in `cat $1`; 
    do ssh $i ./tempinit.sh; 
done 


ansible-playbook init-k8s.yaml -e "cluster=$1"
ansible-playbook init-containerd.yaml -e "cluster=$1"

echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v$debver/deb/ /" > kubernetes.sources

ansible-playbook init-kubeadm.yaml -e "cluster=$1" -e "version=$2" -e "debver=$debver"
ssh $master sudo kubeadm init --pod-network-cidr $podcidr --service-cidr $svccidr
ansible-playbook jump-get-kube-config.yaml --extra-vars "master=$master"
mv /tmp/$master/etc/kubernetes/admin.conf /home/jacint/.kube/config.$1
cp /home/jacint/.kube/config.$1 /home/jacint/.kube/config
# kubectl apply -f flannel-$1.yaml
kubectl apply -f https://reweave.azurewebsites.net/k8s/v$debver/net.yaml

TOKEN=`ssh $master sudo kubeadm token list |grep "kubeadm init" |awk '{print $1}'`
for i in `echo $workers`;do ssh $i sudo kubeadm join $master:6443 --token $TOKEN --discovery-token-unsafe-skip-ca-verification; done
ansible-playbook distribute-kube-config.yaml --extra-vars "cluster=$1"

if [[ $1 == cluster1 ]]
    then
        for i in `echo $workers`;do kubectl patch node $i -p '{"spec":{"podCIDR":"10.77.1.0/24"}}'; done
elif [[ $1 == cluster2 ]]
    then
        for i in `echo $workers`;do kubectl patch node $i -p '{"spec":{"podCIDR":"10.77.2.0/24"}}'; done
elif [[ $1 == cluster3 ]]
    then
        for i in `echo $workers`;do kubectl patch node $i -p '{"spec":{"podCIDR":"10.77.3.0/24"}}'; done
elif [[ $1 == clusterbk ]]
    then
        for i in `echo $workers`;do kubectl patch node $i -p '{"spec":{"podCIDR":"10.77.4.0/24"}}'; done
elif [[ $1 == cluster4 ]]
    then
        for i in `echo $workers`;do kubectl patch node $i -p '{"spec":{"podCIDR":"10.77.5.0/24"}}'; done
elif [[ $1 == cluster5 ]]
    then
        for i in `echo $workers`;do kubectl patch node $i -p '{"spec":{"podCIDR":"10.77.6.0/24"}}'; done
fi

