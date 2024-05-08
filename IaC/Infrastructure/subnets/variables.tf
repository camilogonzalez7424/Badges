# modules/subnets/variables.tf
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "subnet_names" {
  description = "The names of the subnets"
  type        = list(string)
}

variable "location" {
  description = "The location where the resources will be created"
  type        = string
}