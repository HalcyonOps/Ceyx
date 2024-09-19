output "aws_instance_id" {
  value = module.aws_compute.instance_id
}

output "aws_vpc_id" {
  value = module.aws_network.vpc_id
}

output "aws_bucket_name" {
  value = module.aws_storage.bucket_name
}
