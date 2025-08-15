resource "aws_db_instance" "rds_db" {
   identifier = var.db_instance_identifier
   engine = var.db_engine
   engine_version = var.db_engine_version
   instance_class = var.db_instance_class
   allocated_storage = var.db_alloct_storage
   username = var.db_username
   password = var.db_password
   db_subnet_group_name = aws_db_subnet_group.rds_db_subnet_gp.name
   vpc_security_group_ids = aws_security_group.rds.id
   skip_final_snapshot   = true 
   publicly_accessible  = false 
   tags = merge(
      var.tags, { Name = "${each.value}-${var.env}" }
   )
}


resource "aws_db_subnet_group" "rds_db_subnet_gp" {
   subnet_ids = aws_subnet.private.private_subnet_id
}
