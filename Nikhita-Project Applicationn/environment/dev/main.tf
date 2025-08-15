locals {
  common_tags = {
    Environment =  var.env
    Project = "FTR" 
  }
} 


module s3 {
   source = "../../modules/s3"
   env = var.env
   s3_bucket_names = var.s3_bucket_names
   tags = local.common_tags

}


module "aws_instance" {
   source = "../../modules/ec2_instance"
   env = var.env
   ami = var.ami
   key_pair_nm = var.key_pair_nm
   instance_names = var.instance_names
   instance_type = var.instance_type
   tags = local.common_tags
}
