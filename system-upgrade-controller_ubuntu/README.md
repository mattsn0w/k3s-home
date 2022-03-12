# Update the OS of your k3s Ubuntu 20.04 (focal) nodes

1) Installed [k3s System Upgrade Controller](https://github.com/rancher/system-upgrade-controller)
2) Label your nodes that you want the SUC to manage.
3) Apply the plan and wait for nodes to be evicted, jobs created, and the systems updated and rebooted if needed.


## Label Nodes
```
kubectl label nodes \
	node1 \
	node2 \
	node3 \
	node4 \
	node5 \
	node6 \
	node7 \
	plan.upgrade.cattle.io/focal=enabled
``` 

## Apply the Plan which will create jobs and execute the `upgrade.sh` from the secret stringData script.
`kubectl apply -f focal.yaml`


## Monitor the jobs being created

```
$ k get jobs -n system-upgrade
NAME                                                              COMPLETIONS   DURATION   AGE
apply-focal-on-node3-with-093533672586e85d4e02ed0d942c71-a9bec   1/1           5m56s      20m
apply-focal-on-node2-with-093533672586e85d4e02ed0d942c71-ca14a   1/1           3m49s      13m
apply-focal-on-node1-with-093533672586e85d4e02ed0d942c71-fc4d8   1/1           5m59s      19m
apply-focal-on-node7-with-093533672586e85d4e02ed0d942c71-9ec6e   1/1           3m54s      13m
apply-focal-on-node6-with-093533672586e85d4e02ed0d942c71-d2daa   1/1           2m21s      10m
 
```

After a few minutes and reboots of your nodes, everything should be back online and upgraded.
```
k get nodes -o wide
NAME                   STATUS   ROLES                  AGE   VERSION        INTERNAL-IP   EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION      CONTAINER-RUNTIME
node6.co.slakin.net   Ready    <none>                 43d   v1.22.7+k3s1   172.16.1.69   <none>        Ubuntu 20.04.4 LTS   5.4.0-104-generic   containerd://1.5.9-k3s1
node4.co.slakin.net   Ready    <none>                 69d   v1.22.7+k3s1   172.16.1.66   <none>        Ubuntu 20.04.4 LTS   5.4.0-104-generic   containerd://1.5.9-k3s1
node2.co.slakin.net   Ready    <none>                 69d   v1.22.7+k3s1   172.16.1.62   <none>        Ubuntu 20.04.4 LTS   5.4.0-104-generic   containerd://1.5.9-k3s1
node7.co.slakin.net   Ready    <none>                 43d   v1.22.7+k3s1   172.16.1.78   <none>        Ubuntu 20.04.4 LTS   5.4.0-104-generic   containerd://1.5.9-k3s1
node1.co.slakin.net   Ready    control-plane,master   69d   v1.22.7+k3s1   172.16.1.59   <none>        Ubuntu 20.04.4 LTS   5.4.0-104-generic   containerd://1.5.9-k3s1
node5.co.slakin.net   Ready    <none>                 43d   v1.22.7+k3s1   172.16.1.68   <none>        Ubuntu 20.04.4 LTS   5.4.0-104-generic   containerd://1.5.9-k3s1
node3.co.slakin.net   Ready    <none>                 69d   v1.22.7+k3s1   172.16.1.63   <none>        Ubuntu 20.04.4 LTS   5.4.0-104-generic   containerd://1.5.9-k3s1

```

