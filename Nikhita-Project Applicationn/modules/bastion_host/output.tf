output "instance_id" {
   value = aws_instance.db_server.id
}

output "instance_public_ip" {
   value = aws_instance.db_server.public_ip
}

output "instance_private_ip" {
   value = aws_instance.db_server.private_ip
}
