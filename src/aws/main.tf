provider "aws" {
  region = var.region
}

module "aws_compute" {
  source = "../../modules/compute/aws"
  name   = var.name
  region = var.region
  tags   = var.tags
}

module "aws_network" {
  source = "../../modules/network/aws"
  name   = var.name
  region = var.region
  tags   = var.tags
}

module "aws_storage" {
  source = "../../modules/storage/aws"
  name   = var.name
  region = var.region
  tags   = var.tags
}
