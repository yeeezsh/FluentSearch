NAMESPACE=fluentsearch-bff
kubectl get namespace $NAMESPACE -o json > $NAMESPACE.json
sed -i -e 's/"kubernetes"//' $NAMESPACE.json
kubectl replace --raw "/api/v1/namespaces/$NAMESPACE/finalize" -f ./$NAMESPACE.json
