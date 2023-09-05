
variable "subscription_id" {
  type        = string
  description = "subscription id"
  default     = "b7cda313-770f-4cf7-89fd-81621c3709fd"
}

variable "tenant_id" {
  type        = string
  description = "tenamt id"
  default     = "99346566-c77d-4104-b222-6e0915476b75"
}

#variable "resource_group_name_prefix" {
 # type        = string
 # default     = "rg"
 # description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
#}

variable "vm_node_size" {
  type        = string
  description = "vm size"
  default     = "Standard_DS1_v2"
}

variable "node1" {
  type        = string
  description = "vm size"
  default     = "Vm-c1-node1"
}



