variable "st_tier" {
  type        = string
  description = "st tier type"
  default     = "Standard"
}

variable "st_replication_type" {
  type        = string
  description = "st replication type"
  default     = "LRS"
}

variable "st_region" {
  type        = string
  description = "azure st region"
  default     = "East US 2"
}

variable "st_rg_name" {
  type        = string
  description = "rg st name"
  default     = "tfstate"
}

variable "container_name" {
  type        = string
  description = "container name"
  default     = "tfstate"
}

variable "container_access" {
  type        = string
  description = "container access type"
  default     = "private"
}

variable "env_name" {
  type        = string
  description = "rg st name"
  default     = "dev"
}

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
