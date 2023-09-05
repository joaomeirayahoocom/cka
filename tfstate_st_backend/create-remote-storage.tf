terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  
   backend "consul" {
    
    path    = "v1/dev/thistfstate.json"
  }
}

provider "azurerm" {

  skip_provider_registration = true 
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id

  features {
    resource_group {

      prevent_deletion_if_contains_resources = true
    }
  }
  
}

resource "random_string" "resource_code" {

  length  = 5
  special = false
  upper   = false
}

resource "azurerm_resource_group" "tfstate" {

  name     = var.st_rg_name
  location = var.st_region
}

resource "azurerm_storage_account" "tfstate" {

  name                     = "tfstate${random_string.resource_code.result}"
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier             = var.st_tier
  account_replication_type = var.st_replication_type
  allow_nested_items_to_be_public = false

  tags = {
    environment = var.env_name
  }
}

resource "azurerm_storage_container" "tfstate" {
  
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = var.container_access 
}