# Get credentials
az aks get-credentials --resource-group <resource_group_name> --name <aks_name>

# Update secret
kubectl delete secret secret-appsettings --namespace <namespace>
kubectl create secret generic secret-appsettings --from-file=./appsettings.secrets.json --namespace <namespace>
