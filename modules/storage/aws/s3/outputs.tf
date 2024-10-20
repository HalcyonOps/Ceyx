# modules/storage/aws/s3/outputs.tf

output "bucket_id" {
  description = "The ID of the S3 bucket"
  value       = try(aws_s3_bucket.this[0].id, data.aws_s3_bucket.existing_bucket[0].id)
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = try(aws_s3_bucket.this[0].arn, data.aws_s3_bucket.existing_bucket[0].arn)
}

output "bucket_domain_name" {
  description = "The domain name of the S3 bucket"
  value       = try(aws_s3_bucket.this[0].bucket_domain_name, data.aws_s3_bucket.existing_bucket[0].bucket_domain_name)
}

output "bucket_regional_domain_name" {
  description = "The regional domain name of the S3 bucket"
  value       = try(aws_s3_bucket.this[0].bucket_regional_domain_name, data.aws_s3_bucket.existing_bucket[0].bucket_regional_domain_name)
}

output "bucket_hosted_zone_id" {
  description = "The hosted zone ID of the S3 bucket"
  value       = try(aws_s3_bucket.this[0].hosted_zone_id, data.aws_s3_bucket.existing_bucket[0].hosted_zone_id)
}

output "bucket_website_endpoint" {
  description = "The website endpoint of the S3 bucket"
  value       = try(aws_s3_bucket_website_configuration.this[0].website_endpoint, data.aws_s3_bucket.existing_bucket[0].website_endpoint, "N/A")
}

output "bucket_policy" {
  description = "The bucket policy"
  value       = try(aws_s3_bucket_policy.this[0].policy, data.aws_s3_bucket_policy.existing_bucket_policy[0].policy)
}
