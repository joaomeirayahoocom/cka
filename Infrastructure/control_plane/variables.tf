# variables.tf | Auth and Application variables
variable "rg_name" {}

variable "rg_region" {}

variable "rg_id" {}

variable "sub_id"{}

variable "st_endpoint" {}

variable "user_name" {
  type        = string
  description = "The username for the local account that will be created on the new VM."
  default     = "azureadmin"
}

variable "myOsDisk" {
  type        = string
  description = "os disk name"
  default     = "myOsDisk_cp1"
}

variable "vm_size" {
  type        = string
  description = "vm size"
  default     = "Standard_DS1_v2"
}

variable "vm_name" {
  type        = string
  description = "vm control plane"
  default     = "VM-cp1"
}

variable "nic_name" {
  type        = string
  description = "nic cka name"
  default     = "nic-cp1"
}

variable "pip_name"{
  type        = string
  description = "pip name"
  default     = "pip-cp1"
}

variable "nsg_name"{
  type        = string
  description = "nsg name"
  default     = "nsg-cp1"
}

variable "nic_ip_name"{
  type        = string
  description = "nic name"
  default     = "nic_ip-cp1"
}

