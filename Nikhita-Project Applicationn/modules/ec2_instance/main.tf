
resource "aws_instance" "app_server" {
   for_each      = toset(var.instance_names)
   ami           = var.ami
   instance_type = var.instance_type
   key_name      = var.key_pair_nm
   subnet_id =  var.public_subnet_id
   vpc_security_group_ids = var.security_group_ids
   iam_instance_profile = var.instance_profile_name
   tags = merge(
      var.tags, { Name = "${each.value}-${var.env}" }
   )

}
