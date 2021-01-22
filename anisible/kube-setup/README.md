# Kubernetes Cluster Setup

### Creating a Non-Root User on All Remote Servers

create a non-root user with sudo privileges on all servers
```sh
$ ansible-playbook -i hosts ./initial.yml
```

install the operating system level packages
```sh
ansible-playbook -i hosts ./kube-dependencies.yml
```

set up the master node
```sh
ansible-playbook -i hosts ./master.yml
```

adding workers to the cluster
```sh
ansible-playbook -i hosts ./workers.yml
```

check the current state of the cluster
```sh
kubectl get nodes
```
