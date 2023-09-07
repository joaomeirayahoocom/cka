
resource "azurerm_resource_group" "rg_cka" {
  name     = "${var.rg_name}-${terraform.workspace}"
  location = var.rg_region
}

resource "azurerm_virtual_network" "vnet_cka" {
  name                = "${var.vnet_name}-${terraform.workspace}"
  resource_group_name = azurerm_resource_group.rg_cka.name
  location            = var.rg_region
  address_space       = var.cidr_blocks
}

# Create subnet
resource "azurerm_subnet" "sub_cka" {
  name                 = "${var.sub_name}-${terraform.workspace}"
  resource_group_name  = azurerm_resource_group.rg_cka.name
  address_prefixes     = var.subnet_scope
  virtual_network_name = azurerm_virtual_network.vnet_cka.name
}

# Generate random text for a unique storage account name
resource "random_id" "random_id" {

  keepers = {
      # Generate a new ID only when a new resource group is defined
      resource_group = azurerm_resource_group.rg_cka.name
    }

    byte_length = 8
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "st_cka" {
  name                     = "st${random_id.random_id.hex}"
  location                 = var.rg_region
  resource_group_name      = azurerm_resource_group.rg_cka.name
  account_tier             = var.acc_tier
  account_replication_type = "LRS"
}
