# modules/subnets/main.tf
resource "azurerm_virtual_network" "vnet_api_gtw" {
  name                = var.vnet_name_api_gtw
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.vnet_address_space_api_gtw
}

resource "azurerm_virtual_network" "vnet_cluster" {
  name                = var.vnet_name_cluster
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.vnet_address_space_cluster
}

resource "azurerm_public_ip" "pIp" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method
  sku                 = var.sku
}

resource "azurerm_subnet" "bastion_subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_cluster.name
  address_prefixes     = [var.bastion_subnet_prefix]

  depends_on = [
    azurerm_virtual_network.vnet_cluster
  ]
}

resource "azurerm_subnet" "api_gateway_subnet" {
  name                 = var.api_gtw_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name_api_gtw
  address_prefixes     = [var.api_gateway_subnet_prefix]

  depends_on = [
    azurerm_virtual_network.vnet_api_gtw,
    azurerm_virtual_network_peering.api_gtw_to_cluster
  ]

}

resource "azurerm_subnet" "kubernetes_cluster_subnet" {
  name                 = var.cluster_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name_cluster
  address_prefixes     = [var.cluster_subnet_prefix]

  depends_on = [
    azurerm_virtual_network.vnet_cluster,
    azurerm_virtual_network_peering.cluster_to_api_gtw
  ]
}

