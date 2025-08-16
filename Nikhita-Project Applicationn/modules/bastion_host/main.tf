
resource "aws_instance" "db_server" {
   ami           = var.ami
   instance_type = var.instance_type
   key_name      = var.key_pair_nm
   subnet_id =   var.public_subnet_id
   vpc_security_group_ids = var.vpc_security_group_ids
   tags = var.tags
   
}

