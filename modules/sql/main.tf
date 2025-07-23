resource "azurerm_mssql_server" "sqlserver" {
  name                         = var.sql_server_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
}

resource "azurerm_mssql_database" "sqldb" {
  name                = var.database_name
  server_id           = azurerm_mssql_server.sqlserver.id
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  sku_name            = "Basic"
  max_size_gb         = 2
}