# variables.tf | Auth and Application variables
variable "rg_name" {}
variable "rg_region" {}
variable "rg_id" {}
variable "sub_id"{}

variable "user_name" {
  type        = string
  description = "The username for the local account that will be created on the new VM."
  default     = "azureadmin"
}

variable "myOsDisk" {
  type        = string
  description = "os disk name"
  default     = "myOsDisk_node1"
}

variable "acc_tier" {
  type        = string
  description = "account tier name"
  default     = "Standard"
}

variable "vm_size" {
  type        = string
  description = "vm size"
  default     = "Standard_DS1_v2"
}

variable "vm_name" {
  type        = string
  description = "vm control plane"
  default     = "VM-node-01"
}

variable "pip_name1"{
  type        = string
  description = "pip name"
  default     = "pip_node_01"
}

variable "nsg_name1"{
  type        = string
  description = "nsg name"
  default     = "nsg_node_01"
}

variable "nic_name1" {
  type        = string
  description = "nic cka name"
  default     = "nic_node_01"
}

variable "nic_ip_name1"{
  type        = string
  description = "nic name"
  default     = "nic_ip_node_01"
}




