# Create public IPs
resource "azurerm_public_ip" "pip" {
  name                = "${var.pip_name1}-${terraform.workspace}"
  location            = var.rg_region
  resource_group_name = var.rg_name
  allocation_method   = "Dynamic"
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "nsg_cka" {
  name                = "${var.nsg_name1}-${terraform.workspace}"
  location            = var.rg_region
  resource_group_name = var.rg_name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "nic_cka" {
  name                = "${var.nic_ip_name1}-${terraform.workspace}"
  location            = var.rg_region
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "${var.nic_name1}-${terraform.workspace}"
    subnet_id                     = var.sub_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id 
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "nsg_cka" {
  network_interface_id      = azurerm_network_interface.nic_cka.id
  network_security_group_id = azurerm_network_security_group.nsg_cka.id
}

# Generate random text for a unique storage account name
resource "random_id" "random_id" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = var.rg_name
  }

  byte_length = 8
}

# Create storage account for boot diagnostics
  resource "azurerm_storage_account" "st_cka" {
  name                     = "st${random_id.random_id.hex}"
  location                 = var.rg_region
  resource_group_name      = var.rg_name
  account_tier             = var.acc_tier
  account_replication_type = "LRS"
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "vm_cka" {
  name                  = "${var.vm_name}-${terraform.workspace}"
  location              = var.rg_region
  resource_group_name   = var.rg_name
  network_interface_ids = [azurerm_network_interface.nic_cka.id]
  size                  = var.vm_size 


os_disk {
    name                 = "${var.myOsDisk}-${terraform.workspace}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = "40"
}

source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
}

  computer_name  = "${var.vm_name}-${terraform.workspace}"
  admin_username = var.user_name

admin_ssh_key {
    username   = var.user_name
    public_key = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
    #public_key     = file("~/.ssh/id_rsa.pub")
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.st_cka.primary_blob_endpoint
  }
}



