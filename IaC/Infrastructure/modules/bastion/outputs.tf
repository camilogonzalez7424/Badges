output "bastion_host_id" {
  description = "The ID of the bastion host"
  value       = azurerm_bastion_host.bastion.id
}