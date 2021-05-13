# FluentSerch

## repository
- Frontend [FluentSearch-FE](https://github.com/yee2542/FluentSearch-FE)
- Backend for Frontend [FluentSearch-BFF](https://github.com/yee2542/FluentSearch-BFF)
- Storage [FluentSearch-Storage](https://github.com/yee2542/FluentSearch-Storage)
- Insight [FluentSearch-Insight](https://github.com/yee2542/FluentSearch-Insight)
- Insight Video [FluentSearch-Insight-Video](https://github.com/yee2542/FluentSearch-Insight-Video)
- Mini [FluentSearch-Mini](https://github.com/yee2542/FluentSearch-Mini)

## Server Setup
- setup kebernetes on ubuntu [README.md](anisible/kube-setup/)
- setup fluentsearch on kubernetes [README.md](kubernetes/)

## Local Development

### Prerequisite
- Minikube v1.16.0
- Kubernetes v1.20.0
- Docker (macOS) v20.10.0
- Nginx Ingress
- Virtual box v6.1.18

following these commands for prepare an environment

```sh
# start minikube
$ minikube start --vm=true --cpus=4 --memory=6144

# virtual box driver
$ minikube start --vm-driver=virtualbox --cpus=4 --memory=6144

# add ingress
$ minikube addons enable ingress
```

connect to service via minikube tunnel

```sh
$ minikube service -n fluentsearch --url $service

$ minikube service --url fluentsearch-fe-service
```

port forwarding

```sh
$ kubectl port-forward ${type/service} ${port} --addreess 0.0.0.0

$ kubectl port-forward -n fluentsearch svc/fluentsearch-fe-service 80 --address 0.0.0.0
```
