
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



