
kubectl create namespace databases
kubectl create namespace e-commerce-admin
kubectl create namespace e-commerce-store
kubectl apply -f ./pvc/ -n databases
kubectl apply -f ./deployments/mysql-deployment.yaml -n databases
kubectl apply -f ./deployments/deplo.yaml -n e-commerce-admin

#configure argo cd manually

bash bash.sh

kubectl apply -f ./deployments/ingress.yaml -n e-commerce-admin

# Obtiene las credenciales de ACR
ACR_NAME="containerRegistryUnique"
DOCKER_SERVER="${ACR_NAME}.azurecr.io"
DOCKER_USERNAME=$(az acr credential show --name $ACR_NAME --query "username" -o tsv)
DOCKER_PASSWORD=$(az acr credential show --name $ACR_NAME --query "passwords[0].value" -o tsv)
DOCKER_EMAIL="1006845629@u.icesi.edu.co" 

# Crea los secretos en Kubernetes
for NAMESPACE in "databases" "e-commerce-admin" "e-commerce-store"; do
  kubectl create secret docker-registry acr-secret \
    --docker-server=$DOCKER_SERVER \
    --docker-username=$DOCKER_USERNAME \
    --docker-password=$DOCKER_PASSWORD \
    --docker-email=$DOCKER_EMAIL \
    -n $NAMESPACE
done
