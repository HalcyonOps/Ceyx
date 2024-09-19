
output "instance_id" {
  description = "The ID of the GCP instance."
  value       = google_compute_instance.this.id
}

output "public_ip" {
  description = "The public IP address of the GCP instance."
  value       = google_compute_instance.this.network_interface[0].access_config[0].nat_ip
}
