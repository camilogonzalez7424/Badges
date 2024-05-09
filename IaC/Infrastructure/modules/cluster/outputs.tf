output "client_certificate" {
  description = "The Kubernetes managed cluster client certificate"
  value       = azurerm_kubernetes_cluster.k8s.kube_config.0.client_certificate
}

output "kube_config" {
  description = "The Kubernetes cluster config"
  value       = azurerm_kubernetes_cluster.k8s.kube_config_raw
}