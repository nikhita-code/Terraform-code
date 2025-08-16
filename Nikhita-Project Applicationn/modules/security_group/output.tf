output "bastion_sg_id" {
  value = aws_security_group.bastion_sg_rule.id
}

output "rds_sg_id" {
  value = aws_security_group.rds.id
}

/*output "server_appsg_id" {
  value = aws_security_group.app_sg_rule
}
*/
