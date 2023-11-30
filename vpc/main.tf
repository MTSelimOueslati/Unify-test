provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "resto_vpc" {
  cidr_block = var.vpc_cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "resto-vpc"
  }
}

resource "aws_subnet" "subnet" {
  count = length(var.availability_zones)

  vpc_id                  = aws_vpc.resto_vpc.id
  cidr_block              = var.subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = "resto-subnet-${count.index}"
  }
}

output "vpc_id" {
  value = aws_vpc.resto_vpc.id
}

output "availability_zones" {
  value = var.availability_zones
}

output "public_subnets_cidrs" {
  value = [for subnet in aws_subnet.subnet : subnet.cidr_block if subnet.map_public_ip_on_launch]
}

output "private_subnets_cidrs" {
  value = [for subnet in aws_subnet.example_subnet : subnet.cidr_block if !subnet.map_public_ip_on_launch]
}