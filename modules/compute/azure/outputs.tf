
output "vm_id" {
  description = "The ID of the Azure Virtual Machine."
  value       = azurerm_linux_virtual_machine.this.id
}

output "public_ip" {
  description = "The public IP address of the Azure Virtual Machine."
  value       = azurerm_linux_virtual_machine.this.public_ip_address
}
