variable "cluster_name" {
  description = "The name of the Kubernetes cluster"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix specified when creating the managed cluster"
  type        = string
}

variable "node_pool_name" {
  description = "The name of the default node pool"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the default node pool"
  type        = number
}

variable "vm_size" {
  description = "The size of the Virtual Machine"
  type        = string
}

variable "vnet_subnet_id" {
  description = "The ID of the subnet where the AKS cluster will be created"
  type        = string
}

variable "secret_rotation_enabled" {
  description = "Name of the kuberneter file"
}