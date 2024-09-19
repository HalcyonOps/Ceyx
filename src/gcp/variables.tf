variable "name" {
  description = "The name of the project."
  type        = string
}

variable "region" {
  description = "The region where resources will be deployed."
  type        = string
}

variable "project_id" {
  description = "GCP project ID."
  type        = string
}

variable "credentials_file" {
  description = "Path to the GCP credentials file."
  type        = string
}

variable "tags" {
  description = "Common tags to be applied to all resources."
  type        = map(string)
  default     = {}
}
