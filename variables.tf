variable "resource_group_name" {
  default = "vm_sql_rg"
}

variable "location" {
  default = "Australia East"
}

variable "vm_admin_username" {
  default = "adminuser"
}

variable "vm_admin_password" {
  default = "demo!pass123"
}

variable "sql_admin_username" {
  default = "sqladmin"
}

variable "sql_admin_password" {
  description = "The password for the SQL Server."
  default="demo!pass123"
}

variable "sql_server" {
  default="aaidapasql897"
}

variable "vm_size" {
  default = "Standard_B1s"
}

variable "subscription_id" {
  description = "The Subscription ID where the resources will be created."
  default="189548b6-6700-43c9-a255-ea1c906f05a2"
}

