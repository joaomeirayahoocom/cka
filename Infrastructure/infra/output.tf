output "resource_group_id" {
  value = azurerm_resource_group.rg_cka.id
}

output "resource_group_name" {
 value = azurerm_resource_group.rg_cka.name
}

output "resource_group_location" {
 value = azurerm_resource_group.rg_cka.location
}

output "azurerm_subnet_id" {
 value = azurerm_subnet.sub_cka.id
}

output "azurerm_storage_account_primary_blob_endpoint" {
 value = azurerm_storage_account.st_cka.primary_blob_endpoint
}
