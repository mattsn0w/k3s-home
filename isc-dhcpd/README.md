# ISC DHCPD Configuration for Kubernetes

## Why?
I run a DHCP server at home for a combination of use cases from personal computers of various ages to home lab gear.  
The more services I can containerize through Docker of Kubernetes the better so my home environment is easier to manage and restore in case of issues.

## No, why on kubernetes on your home network?
I am constantly learning and trying to stay sharp both personally and professionally.   
I want to have a DHCP server running behind an on premise load balancer, and kubernetes mostly has that.  
Unfortunately, due to how DHCP works and needing to be able to listen on a network interface for ARP broadcasts, this requires 'host networking' and elevated privileges. From a security standpoind, Kubernetes and containerization isn't the ideal place for a DHCP server.

## The half-baked configuration
I have metalLB configured in my cluster and have a load balanced IP address for the deployment. I tried to configure dhcp relay on my router to point to the load balancer IP, but it will not work.  
If you have any recommendations on getting a service to bind to a raw socket please file an issue and let me know!




