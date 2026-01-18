provider "aws" {
  region = var.region
}

resource "aws_vpc" "myvpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "myvpc_public_subnet" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.subnet_cidrs[0]
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zones[0]

  tags = {
    Name = "${var.vpc_name}-public-subnet"
  } 
}

resource "aws_internet_gateway" "myvpc_igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

resource "aws_route_table" "myvpc_public_rt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myvpc_igw.id
  }
    tags = {
        Name = "${var.vpc_name}-public-rt"
    }
}

resource "aws_route_table_association" "myvpc_public_rt_assoc" {
  subnet_id      = aws_subnet.myvpc_public_subnet.id
  route_table_id = aws_route_table.myvpc_public_rt.id
}

output "vpc_id" {
  value = aws_vpc.myvpc.id
}