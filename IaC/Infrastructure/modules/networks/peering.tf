# modules/networks/peering.tf
resource "azurerm_virtual_network_peering" "api_gtw_to_cluster" {
  name                         = var.nameApiToCluster
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.vnet_api_gtw.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet_cluster.id
  allow_virtual_network_access = var.allow_virtual_network_access
}

resource "azurerm_virtual_network_peering" "cluster_to_api_gtw" {
  name                         = var.nameClusterToApiGtw
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.vnet_cluster.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet_api_gtw.id
  allow_virtual_network_access = var.allow_virtual_network_access
}