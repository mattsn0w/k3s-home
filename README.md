# k3s-home
This repo contains manifests for a k3s deployment in my home lab.

## Prerequisites
### Hardware
I have three [1L-PCs](https://www.servethehome.com/introducing-project-tinyminimicro-home-lab-revolution/) running a basic Ubuntu 20.04 LTS Server, prepared as [hypervisors with Ansible](https://github.com/mattsn0w/ubuntu_hypervisor). All 3 are i5-8500T(6-cores) w/ 16GB RAM, and 256GB NVMe SSD.  
I also have a small Jetway NUC which runs a single VM in the cluster.

### Virtualization
Each host has 3x [Ubuntu Cloud](https://cloud-images.ubuntu.com/releases/jammy/release/SHA1SUMS) based KVMs deployed using [Terraform](https://terraform.io/) with [Duncan Mac-Vicar's](https://github.com/dmacvicar) awesome [libvirt provider](https://github.com/dmacvicar/terraform-provider-libvirt). 

### Kubernetes
I used [k3s-ansible](https://github.com/k3s-io/k3s-ansible) to deploy a multi-node cluster with a single control-plane node and 6 worker nodes.
I have since updated to the HA setup with HA control-plane.

## System Upgrade Controller
The [Rancher Labs System Upgrade Controller](https://github.com/rancher/system-upgrade-controller), aka the SUC.
The YAMLs in the respective named directories contain configurations for upgrading k3s nodes, and the where they are deployed on (Ubuntu 20.04 Focal).
These files are from the provided examples in rancher/system-upgrade-controller repo with minor modifications.  
