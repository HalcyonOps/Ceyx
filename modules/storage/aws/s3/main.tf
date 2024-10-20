# Main S3 Bucket Resource

# Replace deprecated "aws_s3_bucket" settings with updated resources

# Versioning configuration should use aws_s3_bucket_versioning
resource "aws_s3_bucket" "this" {
  count = var.create_bucket ? 1 : 0

  bucket = var.bucket_name

  tags = var.s3_tags
}

# Versioning configuration is defined separately
resource "aws_s3_bucket_versioning" "this" {
  count = var.create_bucket ? 1 : 0

  bucket = aws_s3_bucket.this[0].id
  versioning_configuration {
    status = var.versioning_status
  }
}

# Server-side encryption should use aws_s3_bucket_server_side_encryption_configuration
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  count = var.create_bucket ? 1 : 0

  bucket = aws_s3_bucket.this[0].id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.sse_algorithm
      kms_master_key_id = var.kms_master_key_id
    }
  }
}

# Logging configuration should use aws_s3_bucket_logging
resource "aws_s3_bucket_logging" "this" {
  count = var.create_bucket ? 1 : 0

  bucket        = aws_s3_bucket.this[0].id
  target_bucket = var.logging_target_bucket
  target_prefix = var.logging_target_prefix
}

# Website configuration should use aws_s3_bucket_website_configuration
resource "aws_s3_bucket_website_configuration" "this" {
  count = var.create_bucket ? 1 : 0

  bucket = aws_s3_bucket.this[0].id

  index_document {
    suffix = var.website_index_document
  }

  error_document {
    key = var.website_error_document
  }
}

# CORS configuration should use aws_s3_bucket_cors_configuration
resource "aws_s3_bucket_cors_configuration" "this" {
  count = var.create_bucket ? 1 : 0

  bucket = aws_s3_bucket.this[0].id
  cors_rule {
    allowed_headers = var.cors_allowed_headers
    allowed_methods = var.cors_allowed_methods
    allowed_origins = var.cors_allowed_origins
    expose_headers  = var.cors_expose_headers
    max_age_seconds = var.cors_max_age_seconds
  }
}

# Data Block for Existing S3 Bucket
data "aws_s3_bucket" "existing_bucket" {
  count  = var.create_bucket ? 0 : 1
  bucket = var.bucket_name
}

# S3 Bucket Policy Resource
resource "aws_s3_bucket_policy" "this" {
  count = var.create_bucket ? 1 : 0

  bucket = aws_s3_bucket.this[0].id
  policy = var.bucket_policy
}

data "aws_s3_bucket_policy" "existing_bucket_policy" {
  count  = var.create_bucket ? 0 : 1
  bucket = var.bucket_name
}
