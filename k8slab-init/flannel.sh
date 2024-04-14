kubectl apply -f kube-flannel.yml
for i in jjmaster jjkw11 jjkw12 jjkw13 jjkw14; do kubectl patch node $i -p '{"spec":{"podCIDR":"10.77.1.0/24"}}'; done

