## comandos


usar cluster de forma local
```sh
az aks get-credentials --resource-group <resource-group-name> --name <cluster-name>
```

```sh
  # module.apigtw.azurerm_api_management.api will be created
  + resource "azurerm_api_management" "api" {
      + client_certificate_enabled    = false
      + developer_portal_url          = (known after apply)
      + gateway_disabled              = false
      + gateway_regional_url          = (known after apply)
      + gateway_url                   = (known after apply)
      + id                            = (known after apply)
      + location                      = "eastus"
      + management_api_url            = (known after apply)
      + name                          = "apiGtw"
      + notification_sender_email     = (known after apply)
      + policy                        = (known after apply)
      + portal_url                    = (known after apply)
      + private_ip_addresses          = (known after apply)
      + public_ip_addresses           = (known after apply)
      + public_network_access_enabled = true
      + publisher_email               = "company@example.com"
      + publisher_name                = "My Company"
      + resource_group_name           = "ecommerce-resources"
      + scm_url                       = (known after apply)
      + sku_name                      = "Consumption_0"
      + virtual_network_type          = "None"

      + identity {
          + principal_id = (known after apply)
          + tenant_id    = (known after apply)
          + type         = "SystemAssigned"
        }
    }
```