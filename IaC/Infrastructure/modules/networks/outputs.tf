
//subnet

output "api_gateway_subnet_id" {
  description = "The ID of the subnet for the API Gateway"
  value       = azurerm_subnet.api_gateway_subnet.id
}

output "kubernetes_cluster_subnet_id" {
  description = "The ID of the subnet for the Kubernetes cluster"
  value       = azurerm_subnet.kubernetes_cluster_subnet.id
}

output "bastion_subnet_id" {
  description = "The ID of the subnet for the bastion host"
  value = azurerm_subnet.bastion_subnet.id
}

output "bastion_subnet_prefix" {
  value = azurerm_subnet.bastion_subnet.address_prefixes[0]
}

//public ip
output "public_ip_id" {
  description = "The ID of the created Azure Public IP."
  value       = azurerm_public_ip.pIp.id
}

output "apigtw_vnet_name" {
  description = "The ID of the created API gateway Virtual Network."
  value       = azurerm_virtual_network.vnet_api_gtw.name
}