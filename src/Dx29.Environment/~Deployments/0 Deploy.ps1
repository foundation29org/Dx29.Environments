# Get credentials
az aks get-credentials --resource-group <resource_group_name> --name <aks_name>

# Attach Azure Container Registry
az aks update --resource-group <resource_group_name> --name <aks_name> --attach-acr <acr_name>


# Create a namespace for your ingress resources
kubectl create namespace <namespace>

# Add the official stable repository
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

# Use Helm to deploy an NGINX ingress controller
helm install nginx-ingress ingress-nginx/ingress-nginx --namespace <namespace> --set controller.replicaCount=2


# Install the CustomResourceDefinition resources separately
kubectl apply --validate=false -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.11/deploy/manifests/00-crds.yaml

# Create the namespace for cert-manager
kubectl create namespace <cert-manager-namespace>

# Label the cert-manager namespace to disable resource validation
kubectl label namespace <cert-manager-namespace> cert-manager.io/disable-validation=true

# Add the Jetstack Helm repository
helm repo add jetstack https://charts.jetstack.io

# Update your local Helm chart repository cache
helm repo update

# Install the cert-manager Helm chart
helm install cert-manager --namespace <cert-manager-namespace> --version v0.11.0 jetstack/cert-manager


# Apply cluster-issuer staging
kubectl apply -f cluster-issuer.yaml


# Apply app-ingress staging
kubectl apply -f app-ingress.yaml --namespace <namespace>

# Check status
kubectl describe certificate tls-secret-environment --namespace <namespace>

