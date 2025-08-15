locals {
  common_tags = {
    Environment =  var.env
    Project = "FTR" 
  }
} 

module "vpc" {
   source = "../../modules/vpc"
   vpc_cidr = var.vpc_cidr
   vpc_public_cidr = var.vpc_public_cidr
   vpc_private_cidr = var.vpc_private_cidr
   public_subnet_id = var.public_subnet_id
   private_subnet_id = var.private_subnet_id
   vpc_id = var.vpc_id
   igw_id = var.igw_id
   nat_gateway_id = var.nat_gateway_id
   name = var.name
   tags = local.common_tags
}


module "ec2_instance" {
   source = "../../modules/ec2_instance"
   env = var.env
   ami = var.ami
   key_pair_nm = var.key_pair_nm
   instance_names = var.instance_names
   instance_type = var.instance_type
   subnet_id = aws_subnet.

   tags = local.common_tags
}


module s3 {
   source = "../../modules/s3"
   env = var.env
   s3_bucket_names = var.s3_bucket_names
   tags = local.common_tags

}

