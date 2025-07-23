variable "location" { default = "centralindia" }
variable "resource_group_name" { default = "rg-todoapp" }
variable "vnet_name" { default = "vnet-todo" }
variable "subnet_names" {
  type = list(string)
  default = ["subnet1", "subnet2"]
}
variable "admin_username" { default = "azureuser" }
variable "admin_password" { default = "P@ssword1234!" }
variable "vm_name" { default = "ubuntuvm" }
variable "key_vault_name" { default = "todoappkv" }
variable "secret_name" { default = "vm-password" }
variable "sql_server_name" { default = "sqltododemo" }
variable "sql_admin_username" { default = "sqladmin" }
variable "sql_admin_password" { default = "SqlP@ssword123" }
variable "database_name" { default = "tododb" }