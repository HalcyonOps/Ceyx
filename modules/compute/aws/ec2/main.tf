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
  # user_data_base64                     = var.user_data_base64

  lifecycle {
    create_before_destroy = true
  }
}
