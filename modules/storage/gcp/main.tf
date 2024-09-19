
resource "google_storage_bucket" "this" {
  name     = var.bucket_name
  location = var.location

  uniform_bucket_level_access = var.uniform_bucket_level_access

  labels = var.labels
}
