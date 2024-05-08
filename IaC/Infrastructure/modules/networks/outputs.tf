output "api_gateway_subnet_id" {
  description = "The ID of the subnet for the API Gateway"
  value       = azurerm_subnet.api_gateway_subnet.id
}

output "kubernetes_cluster_subnet_id" {
  description = "The ID of the subnet for the Kubernetes cluster"
  value       = azurerm_subnet.kubernetes_cluster_subnet.id
}