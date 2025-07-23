provider "azurerm" {
  features {}
  subscription_id = "08a0553e-c405-4797-8f3c-4ea48da302a9"
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
    depends_on = [ azurerm_resource_group.rg ]
  source              = "../modules/network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  vnet_name           = var.vnet_name
  subnet_names        = var.subnet_names
}

module "vm" {
    depends_on = [module.network ]
  source              = "../modules/vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  subnet_id           = module.network.subnet_ids[0]
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  vm_name             = var.vm_name
}

# module "keyvault" {
#   source              = "../modules/keyvault"
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = var.location
#   key_vault_name      = var.key_vault_name
#   secret_name         = var.secret_name
#   secret_value        = var.admin_password
# }

module "sql" {
  source              = "../modules/sql"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sql_server_name     = var.sql_server_name
  sql_admin_username  = var.sql_admin_username
  sql_admin_password  = var.sql_admin_password
  database_name       = var.database_name
}

output "vm_public_ip" {
  value = module.vm.public_ip
}
