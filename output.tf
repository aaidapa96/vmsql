output "sql_connection_string" {
  value = "Server=${azurerm_mssql_server.sql_server.fully_qualified_domain_name};Database=${azurerm_mssql_database.sql_db.name};User ID=${var.sql_admin_username};Password=${var.sql_admin_password};"
}

output "vm_public_ip" {
  value = azurerm_public_ip.public_ip.ip_address
}
