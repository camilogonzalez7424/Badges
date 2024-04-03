# Configura el proveedor de Azure
provider "azurerm" {
  features {}
}

# Define el grupo de recursos
resource "azurerm_resource_group" "Commerce" {
  name     = "Commerce-resources"
  location = "East US"
}

# Define la red virtual
resource "azurerm_virtual_network" "Commerce" {
  name                = "Commerce-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.Commerce.location
  resource_group_name = azurerm_resource_group.Commerce.name
}

# Define la subred dentro de la red virtual
resource "azurerm_subnet" "Commerce" {
  name                 = "Commerce-subnet"
  resource_group_name  = azurerm_resource_group.Commerce.name
  virtual_network_name = azurerm_virtual_network.Commerce.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_api_management" "Commerce" {
  name                = "Commerce-apim"
  location            = azurerm_resource_group.Commerce.location
  resource_group_name = azurerm_resource_group.Commerce.name
  publisher_name      = "InnovaRetail Corp"
  publisher_email     = "Gonzalezcamilo508@gmail.com"

  sku_name = "Developer_1"
}

# Define el clúster de Kubernetes

resource "azurerm_kubernetes_cluster" "kubernetes_cluster" {
  name                = "Commerce-cluster"
  location            = azurerm_resource_group.Commerce.location
  resource_group_name = azurerm_resource_group.Commerce.name
  dns_prefix          = "Commerce-cluster"
  kubernetes_version  = "1.20.9"

  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}
