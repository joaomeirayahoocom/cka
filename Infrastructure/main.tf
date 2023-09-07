
module "infra" {
  
  source                  = "./infra"
}


module "control_plane" {

  source                  = "./control_plane"

  rg_name                 = module.infra.resource_group_name
  rg_region               = module.infra.resource_group_location
  rg_id                   = module.infra.resource_group_id
  sub_id                  = module.infra.azurerm_subnet_id
  st_endpoint             = module.infra.azurerm_storage_account_primary_blob_endpoint
  
}


module "child_module_Node" {

 for_each = toset(["01", "02", "03"])
  
  source                  = "./child_module_Node/nodes"

  rg_name                 = module.infra.resource_group_name
  rg_region               = module.infra.resource_group_location
  rg_id                   = module.infra.resource_group_id
  sub_id                  = module.infra.azurerm_subnet_id
  st_endpoint             = module.infra.azurerm_storage_account_primary_blob_endpoint
  n1                    = "${each.key}node"
  
}


