# modules/compute/aws/ec2/outputs.tf

output "instance_id" {
  description = "The ID of the instance"
  value       = aws_instance.this.id
}

output "instance_public_ip" {
  description = "The public IP address of the instance"
  value       = aws_instance.this.public_ip
}

output "instance_private_ip" {
  description = "The private IP address of the instance"
  value       = aws_instance.this.private_ip
}

output "instance_type" {
  description = "The type of the instance"
  value       = aws_instance.this.instance_type
}

output "instance_availability_zone" {
  description = "The availability zone of the instance"
  value       = aws_instance.this.availability_zone
}

output "instance_key_name" {
  description = "The key name of the instance"
  value       = aws_instance.this.key_name
}
