# Configure the Azure provider Test !!!!!

terraform {

  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.41.0" #don't jump to 3.1
    }
  }

}

provider "azurerm" {

  subscription_id = var.subscription_id

  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
    key_vault {
      purge_soft_deleted_secrets_on_destroy = true
      recover_soft_deleted_secrets          = true
    }
  }
}

#data "azurerm_client_config" "current" {}
resource "azurerm_resource_group" "rg-keyvault-01" {
  name     = var.resource_group
  location = var.azure_region
}
resource "azurerm_key_vault" "kv-cka-01" {
  name                       = var.key_vault
  location                   = var.azure_region
  resource_group_name        = var.resource_group
  tenant_id                  = var.tenant_id
  sku_name                   = "premium"
  soft_delete_retention_days = 7
   depends_on = [azurerm_resource_group.rg-keyvault-01]
}

#Access policies:
#My Obj Id
resource "azurerm_key_vault_access_policy" "kv_policy_01" {
  key_vault_id = azurerm_key_vault.kv-cka-01.id
  tenant_id    = var.tenant_id
  object_id    = "741844b8-8307-47af-906e-62157e6fbcf7"

  key_permissions = [
      "Restore",
      "Backup",
      "Get",
      "Delete",
      "Recover",
      "List",
      "Create",
  ]
  secret_permissions = [
      "Restore",
      "Backup",
      "Set",
      "Get",
      "Delete",
      "Recover",
      "List",
      "Purge",
  ]
   depends_on = [azurerm_key_vault.kv-cka-01,]
}

#Secrets

#resource "azurerm_key_vault_secret" "client_id" {
  #name         = var.client_id_secret
  #value        = var.client_id
  #key_vault_id = azurerm_key_vault.kv-cka-01.id
     #depends_on = [azurerm_key_vault.kv-cka-01,azurerm_key_vault_access_policy.kv_policy_01]
#}
#resource "azurerm_key_vault_secret" "sp_key" {
  #name         = var.sp_key_secret
 #value        = var.sp_key
  #key_vault_id = azurerm_key_vault.kv-cka-01.id
     #depends_on = [azurerm_key_vault.kv-cka-01,azurerm_key_vault_access_policy.kv_policy_01]
#}

/*module "moduleakv" {

  #only usethe below module on a new infrastructure creation
  source     = "./module/.kv"

  location                  = var.location
  resource_group            = var.resource_group
}*/