
resource "aws_instance" "this" {
  for_each      = toset(var.instance_names)
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_pair_nm
  tags = merge(
      var.tags, { Name = "${each.value}-${var.env}" }
   )

}
