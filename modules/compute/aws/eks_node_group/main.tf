resource "aws_eks_node_group" "this" {
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.node_group_size
    max_size     = var.node_group_max_size
    min_size     = var.node_group_min_size
  }

  instance_types = [var.node_instance_type]
  disk_size      = var.node_disk_size

  remote_access {
    ec2_ssh_key               = var.key_name
    source_security_group_ids = var.source_security_group_ids
  }

  update_config {
    max_unavailable = var.max_unavailable
  }

  launch_template {
    id      = var.launch_template_id
    version = var.launch_template_version
  }

  capacity_type = var.capacity_type

  ami_type = var.ami_type

  tags = var.node_group_tags
}
