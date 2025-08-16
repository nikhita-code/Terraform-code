locals {
  common_tags = {
    Environment =  var.env
    Project = "FTR" 
  }
} 


module "security_groups" {
   source = "../../module/security_groups"
   vpc_id  = var.vpc_id
   bastion_cidr    = var.bastion_cidr
   vpc_private_cidr = var.vpc_private_cidr
   vpc_public_cidr = var.vpc_private_cidr
}

module "vpc" {
   source = "../../module/vpc"
   vpc_cidr = var.vpc_cidr
   vpc_public_cidr = var.vpc_public_cidr
   vpc_private_cidr = var.vpc_private_cidr
   public_subnet_id = var.public_subnet_id
   private_subnet_id = var.private_subnet_id
   vpc_id = var.vpc_id
   igw_id = var.igw_id
   nat_gateway_id = var.nat_gateway_id
   name = var.name
  # tags = local.common_tags
}



module "ec2_instance" {
   source = "../../module/ec2_instance"
   env = var.env
   ami = var.ami
   key_pair_nm = var.key_pair_nm
   instance_names = var.instance_names
   instance_type = var.instance_type
   subnet_id  = var.public_subnet_id
   vpc_security_group_ids  = [ var.security_group_ids ]
   iam_instance_profile = var.instance_profile_name
   tags = local.common_tags
   security_group_ids = [ ]
}


module "s3" {
   source = "../../module/s3"
   env = var.env
   s3_bucket_names = var.s3_bucket_names
   tags = local.common_tags

}

module "iam" {
   source = "../../module/iam"
   role_name = var.role_name
   policy_name = var.policy_name
   instance_profile_name = var.instance_profile_name
}

module "bastion_host" {
   source = "../../module/bastion_host"
   env = var.env
   ami = var.ami
   key_pair_nm = var.key_pair_nm
   instance_names = var.instance_names
   instance_type = var.instance_type
   subnet_id  = var.public_subnet_id
   vpc_security_group_ids  = var.vpc_security_group_ids
   iam_instance_profile = var.instance_profile_name
   tags = local.common_tags
   security_group_ids = [ ]
}


module "rds" {
  source = "../../module/rds"
  db_instance_identifier = var.db_instance_identifier
  db_engine              = var.db_engine
  db_engine_version      = var.db_engine_version
  db_instance_class      = var.db_instance_class
  db_alloct_storage  =  var.db_alloct_storage
  db_username            = var.db_username
  db_password            = var.db_password
  db_subnet_group_name =  var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids.server_rds_sg_id
  tags                   = var.tags
}
