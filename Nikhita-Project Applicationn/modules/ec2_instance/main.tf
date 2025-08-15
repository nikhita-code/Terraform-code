
resource "aws_instance" "this" {
   for_each = toset(var.instance_names)
   ami = var.ami
   instance_type = var.instance_type
   tags = merge{
       var.tags, { Name = "${each.value}-${each.env}"}
    } 
}
