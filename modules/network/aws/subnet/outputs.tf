output "subnet_id" {
  description = "The ID of the subnet"
  value       = aws_subnet.this.id
}

output "subnet_arn" {
  description = "The ARN of the subnet"
  value       = aws_subnet.this.arn
}

output "subnet_cidr_block" {
  description = "The CIDR block of the subnet"
  value       = aws_subnet.this.cidr_block
}

output "subnet_ipv6_cidr_block" {
  description = "The IPv6 CIDR block of the subnet"
  value       = aws_subnet.this.ipv6_cidr_block
}

output "subnet_availability_zone" {
  description = "The availability zone of the subnet"
  value       = aws_subnet.this.availability_zone
}

output "subnet_map_public_ip_on_launch" {
  description = "Whether to map public IPs on launch"
  value       = aws_subnet.this.map_public_ip_on_launch
}

output "subnet_assign_ipv6_address_on_creation" {
  description = "Whether to assign an IPv6 address on creation"
  value       = aws_subnet.this.assign_ipv6_address_on_creation
}
