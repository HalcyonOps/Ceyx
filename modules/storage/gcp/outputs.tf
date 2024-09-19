
output "bucket_id" {
  description = "The ID of the storage bucket."
  value       = google_storage_bucket.this.id
}

output "bucket_self_link" {
  description = "The self link of the storage bucket."
  value       = google_storage_bucket.this.self_link
}
