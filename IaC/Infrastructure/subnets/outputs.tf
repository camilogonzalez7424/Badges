# modules/subnets/outputs.tf
output "subnet_ids" {
  value = azurerm_subnet.subnet.*.id
}