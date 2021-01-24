# FluentSerch

## repository
- Frontend [FluentSearch-FE](https://github.com/yee2542/FluentSearch-FE)
- Backend for Frontend [FluentSearch-BFF](https://github.com/yee2542/FluentSearch-BFF)
- Storage [FluentSearch-Storage](https://github.com/yee2542/FluentSearch-Storage)
- Insight [FluentSearch-Insight](https://github.com/yee2542/FluentSearch-Insight)

## Server Setup
- setup kebernetes on ubuntu [README.md](/ansible/kube-setup)

## Local Development

run minikube

```sh
$ minikube start --cpus=4 --memory=6144
```

connect to service via minikube tunnel

```sh
$ minikube service --url $service

$ minikube service --url fluentsearch-fe-service
```

port forwarding

```sh
$ kubectl port-forward ${type/service} ${port} --addreess 0.0.0.0

$ kubectl port-forward svc/fluentsearch-fe-service 80 --address 0.0.0.0
```