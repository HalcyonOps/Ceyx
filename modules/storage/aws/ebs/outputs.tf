output "volume_id" {
  description = "The ID of the volume"
  value       = aws_ebs_volume.this.id
}

output "snapshot_id" {
  description = "The ID of the snapshot"
  value       = length(aws_ebs_snapshot.this) > 0 ? aws_ebs_snapshot.this[0].id : null
}

output "volume_arn" {
  description = "The ARN of the volume"
  value       = aws_ebs_volume.this.arn
}

output "volume_size" {
  description = "The size of the volume in gigabytes"
  value       = aws_ebs_volume.this.size
}

output "volume_type" {
  description = "The type of the volume"
  value       = aws_ebs_volume.this.type
}

output "volume_iops" {
  description = "The number of IOPS for the volume"
  value       = aws_ebs_volume.this.iops
}

output "volume_encrypted" {
  description = "Whether the volume is encrypted"
  value       = aws_ebs_volume.this.encrypted
}

output "volume_kms_key_id" {
  description = "The KMS key ID used for encryption"
  value       = aws_ebs_volume.this.kms_key_id
}
