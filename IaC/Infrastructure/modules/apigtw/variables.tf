// Define the API Gateway

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "api_gateway_name" {
  description = "The name of the API Gateway"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the API Gateway will be placed"
  type        = string
}

variable "sku_name" {
  description = "The name of the SKU for the Application Gateway."
  type        = string
}

variable "sku_tier" {
  description = "The tier of the SKU for the Application Gateway."
  type        = string
}

variable "sku_capacity" {
  description = "The capacity (instance count) of the SKU for the Application Gateway."
  type        = string
}

variable "gateway_ip_configuration_name" {
  description = "The name of the gateway IP configuration."
  type        = string
}

variable "frontend_ip_configuration_name" {
  description = "The name of the frontend IP configuration."
  type        = string
}

variable "public_ip_address_id" {
  description = "The ID of the public IP address to associate with the frontend IP configuration."
  type        = string
}

variable "frontend_port_name" {
  description = "The name of the frontend port."
  type        = string
}

variable "frontend_port_port" {
  description = "The port number of the frontend port."
  type        = string
}

variable "backend_address_pool_name" {
  description = "The name of the backend address pool."
  type        = string
}

variable "backend_http_settings_name" {
  description = "The name of the backend HTTP settings."
  type        = string
}

variable "backend_http_settings_port" {
  description = "The port number for the backend HTTP settings."
  type        = string
}

variable "backend_http_settings_protocol" {
  description = "The protocol for the backend HTTP settings (e.g., 'Http' or 'Https')."
  type        = string
}

variable "backend_http_settings_request_timeout" {
  description = "The request timeout for the backend HTTP settings (in seconds)."
  type        = string
}

variable "http_listener_name" {
  description = "The name of the HTTP listener."
  type        = string
}

variable "http_listener_frontend_ip_configuration_name" {
  description = "The name of the frontend IP configuration associated with the HTTP listener."
  type        = string
}

variable "http_listener_frontend_port_name" {
  description = "The name of the frontend port associated with the HTTP listener."
  type        = string
}

variable "http_listener_protocol" {
  description = "The protocol for the HTTP listener (e.g., 'Http' or 'Https')."
  type        = string
}

variable "request_routing_rule_name" {
  description = "The name of the request routing rule."
  type        = string
}

variable "request_routing_rule_rule_type" {
  description = "The type of the request routing rule."
  type        = string
}

variable "request_routing_rule_priority" {
  description = "The priority of the request routing rule."
  type        = string
}

variable "request_routing_rule_http_listener_name" {
  description = "The name of the HTTP listener associated with the request routing rule."
  type        = string
}

variable "request_routing_rule_backend_address_pool_name" {
  description = "The name of the backend address pool associated with the request routing rule."
  type        = string
}

variable "request_routing_rule_backend_http_settings_name" {
  description = "The name of the backend HTTP settings associated with the request routing rule."
  type        = string
}

variable "cookie_based_affinity" {
  description = "The cookie-based affinity setting for the backend HTTP settings."
  type        = string
}