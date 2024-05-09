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