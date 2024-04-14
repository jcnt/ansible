ansible-playbook jump-get-kube-config.yaml
mv /tmp/jjmaster/etc/kubernetes/admin.conf /home/jacint/.kube/config
ansible-playbook distribute-kube-config.yaml

