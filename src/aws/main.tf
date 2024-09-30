provider "aws" {
  region = var.region
}

module "aws_compute" {
  source = "../../modules/compute/aws"

  # Required arguments
  name               = var.name
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  region             = var.region
  subnet_id          = var.subnet_id
  security_group_ids = var.security_group_ids
  tags               = var.compute_tags
}

module "aws_network" {
  source = "../../modules/network/aws"

  # Required arguments
  subnet_cidr_block = var.subnet_cidr_block
  availability_zone = var.availability_zone
  cidr_block        = var.cidr_block
  region            = var.region
}


module "aws_storage" {
  source = "../../modules/storage/aws"

  # Required arguments
  region            = var.region
  bucket_name       = var.bucket_name
  tags              = var.storage_tags
  versioning_status = var.versioning_status
}
