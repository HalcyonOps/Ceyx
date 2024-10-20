# General S3 Bucket Configuration
variable "create_bucket" {
  description = "Whether to create the S3 bucket"
  type        = bool
  default     = true
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  validation {
    condition     = can(regex("^[a-z0-9.-]{3,63}$", var.bucket_name))
    error_message = "The bucket name must be between 3 and 63 characters long, and can contain lowercase letters, numbers, dots, and hyphens."
  }
}

variable "versioning_status" {
  description = "The versioning status of the S3 bucket"
  type        = string
  default     = "Disabled"
  validation {
    condition     = contains(["Enabled", "Suspended", "Disabled"], var.versioning_status)
    error_message = "The versioning status must be one of 'Enabled', 'Suspended', or 'Disabled'."
  }
}

variable "sse_algorithm" {
  description = "The server-side encryption algorithm to use"
  type        = string
  default     = "AES256"
  validation {
    condition     = contains(["AES256", "aws:kms"], var.sse_algorithm)
    error_message = "The SSE algorithm must be either 'AES256' or 'aws:kms'."
  }
}

variable "kms_master_key_id" {
  description = "The AWS KMS master key ID used for the SSE-KMS encryption"
  type        = string
}

variable "s3_tags" {
  description = "A map of tags to assign to the S3 bucket"
  type        = map(string)
  default     = {}
}

# Lifecycle Configuration Variables
variable "lifecycle_expiration_days" {
  description = "The number of days after which to expire objects"
  type        = number
  default     = 30
  validation {
    condition     = var.lifecycle_expiration_days >= 0
    error_message = "The lifecycle expiration days must be greater than or equal to 0."
  }
}

# Logging Configuration Variables
variable "logging_target_bucket" {
  description = "The target bucket for S3 access logs"
  type        = string
  default     = null
}

variable "logging_target_prefix" {
  description = "The target prefix for S3 access logs"
  type        = string
  default     = null
}

# Website Configuration Variables
variable "website_index_document" {
  description = "The index document for the S3 website"
  type        = string
  default     = null
}

variable "website_error_document" {
  description = "The error document for the S3 website"
  type        = string
  default     = null
}

# Bucket Policy Variable
variable "bucket_policy" {
  description = "The bucket policy"
  type        = string
  default     = null
}

# CORS Configuration Variables
variable "cors_allowed_headers" {
  description = "List of allowed headers for CORS"
  type        = list(string)
  default     = []
}

variable "cors_allowed_methods" {
  description = "List of allowed methods for CORS"
  type        = list(string)
  default     = ["GET"]
  validation {
    condition     = length(var.cors_allowed_methods) > 0
    error_message = "The CORS allowed methods list must not be empty."
  }
}

variable "cors_allowed_origins" {
  description = "List of allowed origins for CORS"
  type        = list(string)
  default     = ["*"]
  validation {
    condition     = length(var.cors_allowed_origins) > 0
    error_message = "The CORS allowed origins list must not be empty."
  }
}

variable "cors_expose_headers" {
  description = "List of expose headers for CORS"
  type        = list(string)
  default     = []
}

variable "cors_max_age_seconds" {
  description = "The number of seconds for which browsers should cache CORS responses. Set to 0 for unlimited."
  type        = number
  default     = 3600
  validation {
    condition     = var.cors_max_age_seconds >= 0
    error_message = "The CORS max age seconds must be greater than or equal to 0."
  }
}

variable "enable_unlimited_cors_cache" {
  description = "Flag to enable unlimited CORS cache when cors_max_age_seconds is set to 0"
  type        = bool
  default     = false
  validation {
    condition     = !(var.cors_max_age_seconds == 0 && !var.enable_unlimited_cors_cache)
    error_message = "Set enable_unlimited_cors_cache to true if cors_max_age_seconds is set to 0."
  }
}
