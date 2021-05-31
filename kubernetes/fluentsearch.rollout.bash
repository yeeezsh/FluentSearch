kubectl rollout restart -n fluentsearch-fe deployment fluentsearch-fe
kubectl rollout restart -n fluentsearch-bff deployment fluentsearch-bff
kubectl rollout restart -n fluentsearch-storage deployment fluentsearch-storage
kubectl rollout restart -n fluentsearch-admission deployment fluentsearch-admission
kubectl rollout restart -n fluentsearch-spotlight deployment fluentsearch-spotlight
kubectl rollout restart -n fluentsearch-ml deployment fluentsearch-ml
kubectl rollout restart -n fluentsearch-api-federation deployment fluentsearch-api-federation
