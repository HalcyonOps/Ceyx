output "gcp_instance_id" {
  value = module.gcp_compute.instance_id
}

output "gcp_network_id" {
  value = module.gcp_network.network_id
}

output "gcp_bucket_name" {
  value = module.gcp_storage.bucket_name
}
