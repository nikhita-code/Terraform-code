

resource "aws_security_group" "sg_rule" {
   vpc_id = aws_vpc.main_vpc.id
   tags = merge(var.name_sg, { Name = "security_gp_vpc_main"})
    ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = aws_subnet.vpc_public_cidr
    }
    ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = aws_subnet.vpc_public_cidr
    }
    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = "0.0.0.0/0"
    }

}

resource "aws_security_group" "rds" {
   vpc_id = aws_vpc.main_vpc.id
   tags = merge(var.name_sg, { Name = "security_gp_vpc_main_rds"})
    ingress {
      from_port = 3306
      to_port = 3306
      protocol = "tcp"
      cidr_blocks = aws_subnet.vpc_private_cidr
    }
    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = "0.0.0.0/0"
    }

}
