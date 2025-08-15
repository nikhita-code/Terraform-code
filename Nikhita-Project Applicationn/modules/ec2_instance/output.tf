output "instance_id" {
   value = [for name, inst in aws_instance.this : name => inst.id ]
}

output "instance_public_ip" {
   value = [ for name, inst in aws_instance.this : name => inst.public_ip ]
}

output "instance_private_ip" {
   value = [ for name, inst in aws_instance.this : name => inst.private_ip ]
}
