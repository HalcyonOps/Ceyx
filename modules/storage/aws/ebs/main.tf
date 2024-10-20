resource "aws_ebs_volume" "this" {
  availability_zone = var.availability_zone
  size              = var.size
  type              = var.volume_type
  encrypted         = var.encrypted
  kms_key_id        = var.kms_key_id
  tags              = var.ebs_tags

  # Conditionally set the iops attribute
  iops = var.volume_type == "io1" || var.volume_type == "io2" || var.volume_type == "gp3" ? var.iops : null

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_ebs_snapshot" "this" {
  count = var.create_snapshot ? 1 : 0

  volume_id = aws_ebs_volume.this.id
  tags      = var.snapshot_tags
}

resource "aws_ebs_encryption_by_default" "this" {
  enabled = var.encryption_by_default
}
