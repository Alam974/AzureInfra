variable "resource_group_name" {}
variable "location" {}
variable "vnet_name" {}
variable "subnet_names" {
  type = list(string)
}