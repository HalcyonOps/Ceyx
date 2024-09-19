
variable "bucket_name" {
  description = "The name of the storage bucket."
  type        = string
}

variable "location" {
  description = "The GCP region to create the bucket in."
  type        = string
}

variable "uniform_bucket_level_access" {
  description = "Enable uniform bucket-level access for the bucket."
  type        = bool
  default     = true
}

variable "labels" {
  description = "A map of labels to assign to the bucket."
  type        = map(string)
  default     = {}
}

variable "region" {
  description = "The GCP region to deploy resources."
  type        = string
}

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}
