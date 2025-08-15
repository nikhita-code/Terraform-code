
resource "aws_instance" "app_server" {
   for_each      = toset(var.instance_names)
   ami           = var.ami
   instance_type = var.instance_type
   key_name      = var.key_pair_nm
   subnet_id =  aws_subnet.public.public_subnet_id
   security_groups = aws_security_group.sg_rule
   tags = merge(
      var.tags, { Name = "${each.value}-${var.env}" }
   )

}


