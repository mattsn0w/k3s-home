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

