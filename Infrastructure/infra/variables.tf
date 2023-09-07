variable "rg_name" {
  type        = string
  description = "rg name"
  default     = "rg"
}

variable "rg_region" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

variable "vnet_name" {
  type        = string
  description = "vnet cka name"
  default     = "vnet"
}

variable "cidr_blocks" {
  type        = list
  description = "cidr blocks for vnet-cka"
  default     = ["10.0.0.0/16",]
}

variable "subnet_scope" {
  type        = list
  description = "cidr blocks for cka subnet"
  default     = ["10.0.0.0/24",]
}

variable "sub_name" {
  type        = string
  description = "sub cka name"
  default     = "sub"
}

variable "acc_tier" {
  type        = string
  description = "account tier name"
  default     = "Standard"
}



