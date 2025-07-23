# data "azurerm_client_config" "current" {}

# resource "azurerm_key_vault" "kv" {
#   name                = var.key_vault_name
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   tenant_id           = data.azurerm_client_config.current.tenant_id
#   sku_name            = "standard"
#   #soft_delete_enabled = true
#   purge_protection_enabled = false

#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = data.azurerm_client_config.current.object_id
#     secret_permissions = ["Get", "Set", "List"]
#   }
# }

# resource "azurerm_key_vault_secret" "secret" {
#   name         = var.secret_name
#   value        = var.secret_value
#   key_vault_id = azurerm_key_vault.kv.id
# }