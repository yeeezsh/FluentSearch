# Deployments
- fluentsearch-fe `(port: 80)`
- fluentsearch-bff `(port: 3000)`
# Services
- fluentsearch-fe-service `(port: 80, nodePort: 30007)`
- fluentsearch-bff-service `(port: 3000, nodePort: 30009)`

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