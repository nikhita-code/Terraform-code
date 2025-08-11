
provider "aws" {
    region = "us-east-1"  # Set your desired AWS region
}

  locals {
      staging_env = "Nginx_Stage"
    }

/*
resource "aws_key_pair" "example" {
  key_name   = "terraform-demo-nikhita"  # Replace with your desired key name
  public_key = file("~/.ssh/id_rsa.pub")  # Replace with the path to your public key file
}
*/

resource "aws_instance" "example" {
  #  count         = var.create_ec2_instance ? 1 : 0
    ami           = var.amip  # Specify an appropriate AMI ID Ubuntu
    instance_type = var.instance_typep
    key_name = "taerraform-demo-codespace"
    subnet_id = var.subnet_idp
  #  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
    tags = {
        Name = "${local.staging_env}"
      } 




    provisioner "file" {
    source      = "index.html"
    destination = "/tmp/index.html"
     

      connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = self.public_ip
      private_key = file("taerraform-demo-codespace.pem")
    }
  }
    
     provisioner "remote-exec" {
       inline = [
      "sudo mv /tmp/index.html /var/www/html/index.html",
      "sudo yum install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = self.public_ip
      private_key = file("taerraform-demo-codespace.pem")
    }
  }  
}


/*
    # main.tf (EC2 Instance)
    resource "aws_instance" "nginx_example" {
      ami           = var.amip # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type
      instance_type = var.instance_typep
      subnet_id     = aws_subnet.ngx_public_sb.id
      vpc_security_group_ids = [aws_security_group.nginx_sg.id]
      associate_public_ip_address = true # Important for public subnet access
      key_name = "taerraform-demo-codespace" # Replace with your EC2 key pair name

      user_data = <<-EOF
                  #!/bin/bash
                  sudo apt update -y
                  sudo apt install nginx -y
                  sudo systemctl start nginx
                  sudo systemctl enable nginx
                  EOF

      tags = {
        Name = "nginx-ec2-instance"
      }
    }

resource "aws_vpc" "ngx_vpc" {
    cidr_block = var.vpc_cidrp
    tags = { Name = "Nginx-vpc" } 
}

resource "aws_subnet" "ngx_public_sb" {
    vpc_id = aws_vpc.ngx_vpc.id
    cidr_block = var.vpc_public_cidp
    map_public_ip_on_launch = true # Public subnet needs public IPs
    availability_zone = "us-east-1a" # Replace with your desired AZ
    tags = { Name = "Nginx-public-subnet" }
}

resource "aws_subnet" "ngx_private_sb" {
    vpc_id = aws_vpc.ngx_vpc.id
    cidr_block = var.vpc_private_cidrp
    availability_zone = "us-east-1a" # Replace with your desired AZ
    tags = { Name = "Nginx-private-subnet" }
}

resource "aws_internet_gateway" "ngx_ingw" {
  vpc_id = aws_vpc.ngx_vpc.id
  tags = { Name = "Nginx-public-internetgw" }
}

resource "aws_route_table" "ngx_public_rt" {
  vpc_id = aws_vpc.ngx_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ngx_ingw.id
  }
  tags = { Name = "Nginx-public-internetgw" }
}

resource "aws_route_table_association" "rt_public_attach" {
   subnet_id = aws_subnet.ngx_public_sb.id
   route_table_id = aws_route_table.ngx_public_rt.id
}

resource "aws_security_group" "nginx_sg" {
   vpc_id = aws_vpc.ngx_vpc.id
   name   = "nginx-security-group"
   description = "Allow SSH and HTTP traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Be more restrictive in production
    }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = { Name = "nginx-sg" }
}

*/






/*resource "aws_instance" "example" {
    for_each = var.instance_config

    ami           = each.value.amip  # Specify an appropriate AMI ID Ubuntu
    instance_type = each.value.instance_typep 
    key_name = "taerraform-demo-codespace"
    subnet_id = each.value.subnet_idp
    iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
    tags = each.value.tagsp

}
*/
/*
module "ec2_instance" {
  source = "./modules/ec2_instance"
  amip = var.amip # replace this
  instance_typep = var.instance_typep
  subnet_idp =  var.subnet_idp # replace this
}
*/
/*
resource "aws_iam_role" "ec2_role_nikhita" {
  name = "my-ec2-role_nikhita"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}



resource "aws_iam_policy" "policy" {
  name        = "test_policy_nikhita"
  path        = "/"
  description = "My test policy nikhita"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "role_policy_attachment_nikhita" {
  role       = aws_iam_role.ec2_role_nikhita.name
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "my-ec2-instance-profile_nikhita"
  role = aws_iam_role.ec2_role_nikhita.name
}
*/

/*
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "aminoacid" # change this
}


resource "aws_dynamodb_table" "terraform_lock" {
  name           = "aminoacid"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
*/
