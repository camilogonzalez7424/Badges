# Configura el proveedor de Azure
provider "azurerm" {
  features {}
}

# Define el grupo de recursos
module "resource_group"{
  source = "./modules/resource_group"
  name     = "ecommerce-resources"
  location = "East US"
}

module "cluster" {
  source = "./modules/cluster"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  cluster_name        = "myK8sCluster"
  dns_prefix          = "mydns"
  node_pool_name      = "default"
  node_count          = 1
  vm_size             = "Standard_D2_v2"
  vnet_subnet_id      = module.networks.kubernetes_cluster_subnet_id
}

module "networks" {
  source = "./modules/networks"  # Asegúrate de que esta ruta apunta a tu módulo

  vnet_name_api_gtw = "api-gtw-vnet"
  vnet_name_cluster = "cluster-vnet"
  resource_group_name = module.resource_group.name
  location = module.resource_group.location
  vnet_address_space_api_gtw = ["10.1.0.0/16"]
  vnet_address_space_cluster = ["10.2.0.0/16"]

  api_gtw_subnet_name = "api_gtw_subnet"
  api_gateway_subnet_prefix = "10.1.1.0/24"

  cluster_subnet_name = "cluster_subnet"
  cluster_subnet_prefix = "10.2.1.0/24"
}

