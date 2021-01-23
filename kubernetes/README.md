# Local Development

connect to service via minikube tunnel

```sh
minikube service --url $service

minikube service --url fluentsearch-fe-service
```

port forwarding

```sh
kubectl port-forward ${type/service} ${port} --addreess 0.0.0.0

kubectl port-forward svc/fluentsearch-fe-service 80 --address 0.0.0.0
```