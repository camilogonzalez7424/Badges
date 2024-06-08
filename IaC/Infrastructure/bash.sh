#!/bin/bash

# Ejecutar el comando de Azure CLI con los valores obtenidos
appgwId=$(az network application-gateway list -g ecommerce-resources --query "[?name=='apiGatewayUnique'].id" -o tsv)

export AKS_OIDC_ISSUER="$(az aks show --resource-group ecommerce-resources --name myK8sCluster --query "oidcIssuerProfile.issuerUrl" -o tsv)"

# Habilita los addons para la puerta de enlace de aplicaciones
az aks enable-addons -n myK8sCluster -g ecommerce-resources -a ingress-appgw --appgw-id $appgwId

# Activa el managed identity
az aks update -g ecommerce-resources -n myK8sCluster --enable-managed-identity
