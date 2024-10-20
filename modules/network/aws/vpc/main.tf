resource "aws_vpc" "this" {
  cidr_block = var.cidr_block
  tags       = var.vpc_tags

  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_vpc_ipv6_cidr_block_association" "this" {
  count = var.assign_ipv6_cidr_block ? 1 : 0

  vpc_id          = aws_vpc.this.id
  ipv6_cidr_block = var.ipv6_cidr_block
}

resource "aws_internet_gateway" "this" {
  count = var.create_internet_gateway ? 1 : 0

  vpc_id = aws_vpc.this.id
  tags   = var.igw_tags
}

resource "aws_nat_gateway" "this" {
  count = var.create_nat_gateway ? 1 : 0

  allocation_id = var.nat_allocation_id
  subnet_id     = var.nat_subnet_id
  tags          = var.nat_tags
}

resource "aws_vpn_gateway" "this" {
  count = var.create_vpn_gateway ? 1 : 0

  vpc_id = aws_vpc.this.id
  tags   = var.vpn_tags
}
