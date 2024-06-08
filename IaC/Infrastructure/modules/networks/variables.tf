# modules/subnets/variables.tf
variable "vnet_name_cluster" {
  description = "The name of the virtual network"
  type        = string
}

variable "vnet_name_api_gtw" {
  description = "The name of the virtual network"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "vnet_address_space_api_gtw" {
  description = "The address space of the virtual network"
  type        = list(string)
}

variable "vnet_address_space_cluster" {
  description = "The address space of the virtual network"
  type        = list(string)
}

variable "api_gtw_subnet_name" {
  description = "The name of the API gateway subnet"
  type        = string
}

variable "api_gateway_subnet_prefix" {
  description = "The address prefix of the API gateway subnet"
  type        = string
}

variable "cluster_subnet_name" {
  description = "The name of the Kubernetes cluster subnet"
  type        = string
}

variable "cluster_subnet_prefix" {
  description = "The address prefix of the Kubernetes cluster subnet"
  type        = string
}

variable "nameClusterToApiGtw" {
  description = "The name of the virtual network"
  type        = string
}

variable "nameApiToCluster" {
  description = "The name of the virtual network"
  type        = string
}

variable "allow_virtual_network_access" {
  description = "Allow network access between peered VNets"
  type        = bool
  default     = true
}
variable "bastion_subnet_prefix" {
  type = string
}

variable "public_ip_name" {
  description = "The name of the public IP address"
  type = string
}

variable "allocation_method" {
  description = "The allocation method of the public IP address"
  type = string
}

variable "sku" {
  description = "The SKU of the public IP address"
  type = string
}