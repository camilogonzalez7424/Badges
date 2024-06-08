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

module "bastion" {
  source = "./modules/bastion"
  bastion_name        = "bastion_admin_ecommerce"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  subnet_id           = module.networks.bastion_subnet_id
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
  secret_rotation_enabled = true

}


module "networks" {
  source = "./modules/networks"  # Asegúrate de que esta ruta apunta a tu módulo
  vnet_name_api_gtw = "api-gtw-vnet"
  vnet_name_cluster = "cluster-vnet"
  resource_group_name = module.resource_group.name
  location = module.resource_group.location
  vnet_address_space_api_gtw = ["10.1.0.0/16"]
  vnet_address_space_cluster = ["10.2.0.0/16"]

  allocation_method                   = "Static"
  sku                                 = "Standard"
  public_ip_name                      = "gatewayTestIpPublic"

  api_gtw_subnet_name = "api_gtw_subnet"
  api_gateway_subnet_prefix = "10.1.1.0/24"
  nameApiToCluster = "peering-api-gtw-to-cluster"
  allow_virtual_network_access = true

  cluster_subnet_name = "cluster_subnet"
  cluster_subnet_prefix = "10.2.1.0/24"
  nameClusterToApiGtw = "peering-cluster-to-api-gtw"
  bastion_subnet_prefix = "10.2.2.0/24"
}

module "security" {
  source                    = "./modules/security"
  nsg_name                  = "aks_nsg"
  location                  = module.resource_group.location
  resource_group_name       = module.resource_group.name
  kubernetes_cluster_subnet_id = module.networks.kubernetes_cluster_subnet_id
  bastion_subnet_prefix     = module.networks.bastion_subnet_prefix
}

module "container_registry" {
  source                  = "./modules/registry"
  container_name          = "containerRegistryUnique"
  resource_group_name     = module.resource_group.name
  resource_group_location = module.resource_group.location
  container_sku           = "Standard"
}

module "apigtw" {
  source                                          = "./modules/apigtw"
  resource_group_name                             = module.resource_group.name
  location                                        = module.resource_group.location
  api_gateway_name                                = "apiGatewayUnique"
  subnet_id                                       = module.networks.api_gateway_subnet_id
  sku_name                                        = "Standard_v2"
  sku_tier                                        = "Standard_v2"
  sku_capacity                                    = 2
  gateway_ip_configuration_name                   = "appGatewayIpConfig"
  frontend_ip_configuration_name                  = "frontendConfig"
  public_ip_address_id                            = module.networks.public_ip_id
  frontend_port_name                              = "frontendPort"
  frontend_port_port                              = 80
  backend_address_pool_name                       = "backendPool"
  backend_http_settings_name                      = "backendHttpSettings"
  cookie_based_affinity                           = "Disabled"
  backend_http_settings_port                      = 80
  backend_http_settings_protocol                  = "Http"
  backend_http_settings_request_timeout           = 120
  http_listener_name                              = "httpListener"
  http_listener_frontend_ip_configuration_name    = "frontendConfig"
  http_listener_frontend_port_name                = "frontendPort"
  http_listener_protocol                          = "Http"
  request_routing_rule_name                       = "routingRule"
  request_routing_rule_rule_type                  = "Basic"
  request_routing_rule_priority                   = 9
  request_routing_rule_http_listener_name         = "httpListener"
  request_routing_rule_backend_address_pool_name  = "backendPool"
  request_routing_rule_backend_http_settings_name = "backendHttpSettings"
}

data "azurerm_client_config" "current" {}

module "key_vault" {
  source                              = "./modules/key_vault"
  key_vault_name                      = "myKeyVault-10888"
  resource_group_name                 = module.resource_group.name
  location                            = module.resource_group.location
  tenant_id                           = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption         = true
  purge_protection_enabled            = false
  soft_delete_retention_days          = 7
  sku_name                            = "standard"
  object_id                           = coalesce(null, data.azurerm_client_config.current.object_id)
  key_permissions                     = ["Get", "Create", "List", "Delete", "Purge", "Recover", "SetRotationPolicy", "GetRotationPolicy"]
  secret_permissions                  = ["Get", "Set", "List", "Delete", "Purge", "Recover"]
  certificate_permissions             = ["Get"]
  secret_names                        = ["NEXT-PUBLIC-CLERK-PUBLISHABLE-KEY", "CLERK-SECRET-KEY", "NEXT-PUBLIC-CLERK-SIGN-IN-URL", "NEXT-PUBLIC-CLERK-AFTER-SIGN-IN-URL", "DATABASE-URL", "NEXT-PUBLIC-CLOUDINARY-CLOUD-NAME", "NEXT-PUBLIC-CLERK-SIGN-UP-URL", "NEXT-PUBLIC-CLERK-AFTER-SIGN-UP-URL", "FRONTEND-STORE-URL", "STRIPE-API-KEY", "STRIPE-WEBHOOK-SECRET", "NEXT-PUBLIC-API-URL"]
  secret_values                       = ["pk_test_Y2FwaXRhbC1odW1wYmFjay01NC5jbGVyay5hY2NvdW50cy5kZXYk", "sk_test_M41hUtSCghLofhQpfdby0kGTY6j06Aa1SpJuC3HVnA", "/sign-in", "/", "mysql://admin:Pass123.@mysql-server.databases.svc.cluster.local:3306/ecommerce_db", "dlviqeipm", "/sign-up", "/", "http://store-ecommerce-store.e-commerce.svc.cluster.local:3001", "sk_test_51Owc1jRrb328b1F6XFoBh6eQPDlB3lYK7UwHUVKpqnTtbuN8i7C5sSbSFpeAqIgikjCEO31v8GINtk2RYyBySKdT006G0kdxsM", "whsec_d78b83441dd891931db532bfccd6a04e94d473efb5f4bcca45672cb2dfbc251a", "http://admin-e-commerce-admin.e-commerce.svc.cluster.local:3000/api/e4842c25-047e-450d-bdda-2cc42a4bec6d"]
  key_names                           = ["Key1", "Key2"]
  key_types                           = ["RSA", "RSA"]
  key_sizes                           = [2048, 2048]
  key_opts                            = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
  time_before_expiry                  = "P30D"
  expire_after                        = "P90D"
  notify_before_expiry                = "P29D"
  user_assigned_identity_principal_id = module.me.principal_id
  aks_secret_provider_id              = module.cluster.secret_provider
}

module "me" {
  source              = "./modules/me"
  name                = "myUserIdentity"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
}
