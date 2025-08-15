output "vps_id" {
  value = aws_vpc.this.id
}

output "public_subnet_id" {
    value = [ for s in aws_subnet.public.this : s.id ] 
}

output "private_subnet_id" {
    value = [ for s in aws_subnet.private.this : s.id ]
}
 
