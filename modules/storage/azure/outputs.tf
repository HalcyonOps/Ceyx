
output "storage_account_id" {
  description = "The ID of the storage account."
  value       = azurerm_storage_account.this.id
}

output "container_id" {
  description = "The ID of the storage container."
  value       = azurerm_storage_container.this.id
}
