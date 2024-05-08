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

module "networks" {
  source = "./modules/networks"  # Asegúrate de que esta ruta apunta a tu módulo

  vnet_name = "ecommerce-vnet"
  resource_group_name = module.resource_group.name
  location = "East US"
  vnet_address_space = ["10.0.0.0/16"]

  api_gtw_subnet_name = "api_gtw_subnet"
  api_gateway_subnet_prefix = "10.0.1.0/24"

  cluster_subnet_name = "cluster_subnet"
  cluster_subnet_prefix = "10.0.2.0/24"
}
