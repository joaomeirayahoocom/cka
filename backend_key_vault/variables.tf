# variables.tf | Auth and Application variables


variable "resource_group" {
   type    = string
  default = "rg_keyvault_01"
}

variable "azure_region" {
  type        = string
  description = "azure region"
  default     = "East US"
}

variable "subscription_id" {
  type        = string
  description = "subscription id"
  default     = "13de304c-de4e-4a4e-97c2-29a3cd2e0d0b"
}

variable "tenant_id" {
  type        = string
  description = "tenamt id"
  default     = "2a2de861-da68-4b63-b608-9385c10e328a"
}

variable "key_vault" {
  type    = string
  default = "kv-cka-01"
}

variable "object_id" {
  type    = string
  default = "741844b8-8307-47af-906e-62157e6fbcf7"
}

variable "client_id" {
   type    = string
  default = "1f111d46-6adc-45d9-97e0-c0355c51c927"
}


variable "object_id_secret" {
  type    = string
  default = "object-id"
}

variable "sp_key_secret" {
  type    = string
  default = "sp_key"
}