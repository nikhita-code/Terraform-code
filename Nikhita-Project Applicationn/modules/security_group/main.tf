
resource "aws_security_group" "bastion_sg_rule" {
    vpc_id = var.vpc_id
    name = "bastion_host_machine_sg"
    ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks  = [var.bastion_cidr] 
    }
    ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks  = [var.vpc_public_cidr] 
    }
    
    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

}

resource "aws_security_group" "rds" {
    vpc_id = var.vpc_id
    name = "bastion_host_rds_sg"
    ingress {
      from_port = 3306
      to_port = 3306
      protocol = "tcp"
      cidr_blocks = [var.vpc_private_cidr]
    }
    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

}


