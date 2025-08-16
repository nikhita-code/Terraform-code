provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main_vpc" {
   cidr_block = var.vpc_cidr
   enable_dns_support = true
   enable_dns_hostnames = true
  # tags = var.tags
}

resource "aws_subnet" "public" {
   vpc_id = aws_vpc.main_vpc.id
   cidr_block = var.vpc_public_cidr
   map_public_ip_on_launch = true
#    tags = merge(var.tags, { Name = "${var.env}-public-subnet" })
}

resource "aws_subnet" "private" {
   vpc_id = aws_vpc.main_vpc.id
   cidr_block = var.vpc_private_cidr
  #  tags = merge(var.tags, { Name = "${var.env}-private-subnet" })

}

resource "aws_internet_gateway" "public_ig" {
   vpc_id = aws_vpc.main_vpc.id
  #  tags   = merge(var.tags, { Name = "${var.env}-igw" })
}

resource "aws_eip" "nat_gw_eip" {
   domain = "vpc" 
}

resource "aws_nat_gateway" "private_nig" {
   allocation_id = aws_eip.nat_gw_eip.id
   subnet_id = aws_subnet.public.id
  #  tags = merge(var.tags, { Name = "${var.env}-nat-gw" })

}

resource "aws_route_table" "public_rt" {
   vpc_id = aws_vpc.main_vpc.id
   route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.public_ig.id
   }
 #   tags = merge(var.tags, { Name = "${var.env}-rt-gw" })

}

resource "aws_route_table_association" "public_rt_assoc" {
   subnet_id = aws_subnet.public.id
   route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
   vpc_id = aws_vpc.main_vpc.id
   route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.private_nig.id
   }
  #  tags = merge(var.tags, { Name = "${var.env}-rt-ngw" })
}

resource "aws_route_table_association" "private_rt_assoc" {
   subnet_id = aws_subnet.private.id
   route_table_id = aws_route_table.private_rt.id
}

