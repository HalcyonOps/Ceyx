output "node_group_id" {
  description = "The ID of the EKS node group"
  value       = aws_eks_node_group.this.id
}

output "node_group_arn" {
  description = "The ARN of the EKS node group"
  value       = aws_eks_node_group.this.arn
}

output "node_group_status" {
  description = "The status of the EKS node group"
  value       = aws_eks_node_group.this.status
}

output "node_group_instance_types" {
  description = "The instance types of the EKS node group"
  value       = aws_eks_node_group.this.instance_types
}

output "node_group_disk_size" {
  description = "The disk size of the nodes in the EKS node group"
  value       = aws_eks_node_group.this.disk_size
}
