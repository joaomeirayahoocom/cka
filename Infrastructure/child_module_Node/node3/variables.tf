# variables.tf |For node 1
variable "rg_name" {}
variable "rg_region" {}
variable "rg_id" {}
variable "sub_id"{}

variable "n3" {
  type        = string
  description = "env count"
  default     = "03"
}

variable "user_name" {
  type        = string
  description = "The username for the local account that will be created on the new VM."
  default     = "azureadmin"
}

variable "myOsDisk" {
  type        = string
  description = "os disk name"
  default     = "myOsDisk"
}

variable "acc_tier" {
  type        = string
  description = "account tier name"
  default     = "Standard"
}

variable "pip_name"{
  type        = string
  description = "pip name"
  default     = "pip_node"
}

variable "nsg_name"{
  type        = string
  description = "nsg name"
  default     = "nsg_node"
}

variable "nic_name" {
  type        = string
  description = "nic cka name"
  default     = "nic_node"
}

variable "nic_ip_name"{
  type        = string
  description = "nic name"
  default     = "nic_ip_node"
}

variable "vm_size" {
  type        = string
  description = "vm size"
  default     = "Standard_DS1_v2"
}

variable "vm_name" {
  type        = string
  description = "vm control plane"
  default     = "VM-node"
}

