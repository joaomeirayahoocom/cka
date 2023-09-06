
module "infra" {
  
  source                  = "./infra"
}

module "control_plane" {
  
  source                  = "./control_plane"

  rg_name                 = module.infra.resource_group_name
  rg_region               = module.infra.resource_group_location
  rg_id                   = module.infra.resource_group_id
  sub_id                  = module.infra.azurerm_subnet_id

}

module "child_module_Node" {
  
  source                  = "./child_module_Node/node1"

  rg_name                 = module.infra.resource_group_name
  rg_region               = module.infra.resource_group_location
  rg_id                   = module.infra.resource_group_id
  sub_id                  = module.infra.azurerm_subnet_id
}

module "child_module_Node2" {
  
  source                  = "./child_module_Node/node2"

  rg_name                 = module.infra.resource_group_name
  rg_region               = module.infra.resource_group_location
  rg_id                   = module.infra.resource_group_id
  sub_id                  = module.infra.azurerm_subnet_id
}

module "child_module_Node3" {
  
  source                  = "./child_module_Node/node3"

  rg_name                 = module.infra.resource_group_name
  rg_region               = module.infra.resource_group_location
  rg_id                   = module.infra.resource_group_id
  sub_id                  = module.infra.azurerm_subnet_id
}

