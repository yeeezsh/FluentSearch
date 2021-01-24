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
| ------------- |:-------------|
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

refs: https://github.com/bitnami/charts/tree/master/bitnami/mongodb-sharded

## sharding enable

```sh

# enable DB
$ sh.enableSharding("${DB_NAME}")
$ sh.enableSharding("bff")

# enable collection
$ sh.shardCollection( "${COLLECTION_NAME}", { "_id" : "hashed" } )
$ sh.shardCollection( "bff-test.test", { "_id" : "hashed" } )
```


# Local Development

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

# Linkerd Injection

install linkerd

```sh
# check k8s environment
$ linkerd check --pre

# install
$ linkerd install | kubectl apply -f -

# check deploy status
$ linkerd check
$ kubectl -n linkerd get deploy
```

inject linkerd to pods

```sh
# inject all service in fluentsearch namspace
$ kubectl get deploy -n fluentsearch -o yaml | linkerd inject - | kubectl apply -f -

# inject linkerd via folder target
$ linkerd inject ${dir} | kubectl apply -f -

# e.g. inject fe
$ linkerd inject ./fe | kubectl apply -f -
```

expose service after injection

```sh
$ kubectl -n default port-forward ${type/service} ${port} --address=0.0.0.0

$ kubectl -n fluentsearch port-forward svc/fluentsearch-fe-service 80 --address=0.0.0.0
```

the Linkerd dashboard by running

```sh
$ linkerd dashboard &
```
