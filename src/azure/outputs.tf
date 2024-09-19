output "azure_vm_id" {
  value = module.azure_compute.vm_id
}

output "azure_vnet_id" {
  value = module.azure_network.vnet_id
}

output "azure_storage_account_name" {
  value = module.azure_storage.storage_account_name
}
