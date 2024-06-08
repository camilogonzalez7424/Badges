output "api_gateway_id" {
  description = "The ID of the API Gateway"
  value       = azurerm_application_gateway.api.id
}

output "api_gateway_name" {
  description = "The ID of the created Azure Application Gateway."
  value       = azurerm_application_gateway.api.name
}