# Service Cache

## Overview

Simple store of generic, bare-bones, and custom service configs used in private deployments.

Much of the structure and layout of this and other repos are heavily influenced by the work of [jumanjihouse](https://github.com/jumanjihouse)

---

## Service Deployment Arch

### Overview

I've enjoyed working with Consul/Nomad deployment structures. I haven't played around too much with k8s, but I have worked a lot with HashiStack and love it.

### Layout

Some rules I've learned from cloud service deployments
- One cluster per environment
	- Exception: critical services that need dedicated clusters / separation from other <env> services
- Multiple sites per cluster
- Each site has at least one load balancer
- Multiple nodes per load balancer 

### Future work

I'm working to use tools like OpenStack to spin up my own private deployments


_spiffycell_
