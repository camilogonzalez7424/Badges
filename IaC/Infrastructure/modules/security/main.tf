resource "azurerm_network_security_group" "aks_nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowSSHFromBastion"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"  # o 443 para HTTPS
    source_address_prefix      = var.bastion_subnet_prefix  
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "aks_subnet_nsg_assoc" {
  subnet_id                 = var.kubernetes_cluster_subnet_id
  network_security_group_id = azurerm_network_security_group.aks_nsg.id
}
