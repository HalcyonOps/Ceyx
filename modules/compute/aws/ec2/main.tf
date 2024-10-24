# AWS EC2 Instance Resource Configuration
resource "aws_instance" "this" {
  ami                     = var.ami
  disable_api_termination = var.disable_api_termination
  instance_type           = var.instance_type
  monitoring              = var.monitoring
  subnet_id               = var.subnet_id
  tags                    = var.ec2_tags
  vpc_security_group_ids  = var.security_group_ids
  key_name                = var.key_name

  associate_public_ip_address          = var.associate_public_ip_address
  availability_zone                    = var.availability_zone
  ebs_optimized                        = var.ebs_optimized
  iam_instance_profile                 = var.iam_instance_profile
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  user_data                            = var.user_data

  # Configuring the root volume of the instance
  root_block_device {
    volume_type           = var.root_volume_type
    volume_size           = var.root_volume_size
    delete_on_termination = var.root_delete_on_termination
    encrypted             = var.root_encrypted
    iops                  = var.root_iops
    kms_key_id            = var.root_kms_key_id
    tags                  = var.volume_tags
  }

  # Adding additional EBS block devices
  dynamic "ebs_block_device" {
    for_each = var.ebs_block_devices
    content {
      device_name           = ebs_block_device.value.device_name
      volume_type           = ebs_block_device.value.volume_type
      volume_size           = ebs_block_device.value.volume_size
      delete_on_termination = ebs_block_device.value.delete_on_termination
      encrypted             = ebs_block_device.value.encrypted
      iops                  = ebs_block_device.value.iops
      kms_key_id            = ebs_block_device.value.kms_key_id
    }
  }

  # Lifecycle configuration to ensure the instance is created before it is destroyed
  lifecycle {
    create_before_destroy = true
  }
}

# Volume attachment resource for additional EBS volumes
resource "aws_volume_attachment" "additional_ebs_volumes" {
  for_each     = var.additional_volumes
  instance_id  = aws_instance.this.id
  volume_id    = each.value
  device_name  = each.key
  skip_destroy = false
  force_detach = false
}
