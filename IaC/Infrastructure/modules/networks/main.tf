# modules/subnets/main.tf
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "api_gateway_subnet" {
  name                 = var.api_gtw_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.api_gateway_subnet_prefix]

  depends_on = [
    azurerm_virtual_network.vnet
  ]

}

resource "azurerm_subnet" "kubernetes_cluster_subnet" {
  name                 = var.cluster_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.cluster_subnet_prefix]

  depends_on = [
    azurerm_virtual_network.vnet
  ]
}