resource "aws_vpc" "" {
   cidr_block = var.vpc_cidr
   enable_dns_support = true
   enable_dns_hostnames = true
   tags = var.tags
}

resource "aws_subnet" "public" {
   vpc_id = aws_vpc.
   cidr_block = 
}


resource "aws_internet_gateway" "public_ig" {
    vpc_id = var.vpc_id
    tags = { Name = "public_ig" }
}

