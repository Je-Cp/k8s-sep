
kubectl create secret generic starburstdata --from-file starburstdata.license

helm repo update

kubectl delete secret gcs-keyfile --n xxx
kubectl create secret generic gcs-keyfile --from-file=key.json --n xxx

kubectl delete secret type-mapping -n xxx
kubectl delete secret cache-rules -n xxx
kubectl create secret generic type-mapping --from-file=type-mapping.json --n xxx
kubectl create secret generic cache-rules --from-file=cache-rules.json --n xxx


kubectl apply -f vars.yml --namespace xx


echo "Deploy HMS"
helm upgrade hive starburstdata/starburst-hive --install --version 423.1 --values ./registryCredentials.yml --values ./hive.yml -n xxx


echo "Deploy SEP"
helm upgrade sep starburstdata/starburst-enterprise \
  --install \
  --values ./registryCredentials.yml \
  --values ./sep_install.yml --n xxx
