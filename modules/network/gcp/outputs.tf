
output "network_id" {
  description = "The ID of the network."
  value       = google_compute_network.this.id
}

output "subnet_id" {
  description = "The ID of the subnet."
  value       = google_compute_subnetwork.this.id
}
