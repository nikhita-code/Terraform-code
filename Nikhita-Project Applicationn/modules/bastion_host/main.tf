
resource "aws_instance" "db_server" {
   ami           = var.ami
   instance_type = var.instance_type
   key_name      = var.key_pair_nm
   subnet_id =   aws_subnet.public.public_subnet_id
   security_groups = aws_security_group.sg_rule
   tags = var.tags
   
}

