# Deployments
- fluentsearch-fe `(port: 80)`
- fluentsearch-bff `(port: 3000)`
# Services
- fluentsearch-fe-service `(port: 80, nodePort: 30007)`
- fluentsearch-bff-service `(port: 3000, nodePort: 30009)`


## MongoDB
install via `helm`

```sh
$ helm repo add bitnami https://charts.bitnami.com/bitnami

# local
$ helm install -f ./mongodb/values.local.yml fluentsearch-mongodb bitnami/mongodb-sharded -n fluentsearch

# production
$ helm install -f ./mongodb/values.yml fluentsearch-mongodb bitnami/mongodb-sharded -n fluentsearch
```

config values

| config        | value           |
| ------------- |:-------------:|
| shards (data node)      | 3 |
| shards (replica)      | 2 |
| arbiter      | 1      |
| config server | 2      |
| mongos | 2      |
| replica set key | fluentsearch      |
| root password | Fluent$earch@MongoDB      |

connect via port-forward

```sh
# connect to mongos
$ kubectl port-forward -n fluentsearch svc/fluentsearch-mongodb 27017:27017 &
    mongo --host 127.0.0.1 --authenticationDatabase admin -p ${MONGODB_ROOT_PASSWORD}

# port forward
$ kubectl port-forward -n fluentsearch svc/fluentsearch-mongodb 27017:27017

# uninstall
$ helm delete fluentsearch-mongodb -n fluentsearch
```

refs: https://github.com/bitnami/charts/tree/master/bitnami/mongodb-sharded/#installing-the-chart

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

# Linkerd Injection

inject linkerd to all services

```sh
kubectl get deploy -n fluentsearch -o yaml | linkerd inject - | kubectl apply -f -
```

expose service

```sh

kubectl -n default port-forward ${type/service} ${port} --address=0.0.0.0

kubectl -n default port-forward svc/fluentsearch-fe-service 80 --address=0.0.0.0
```
