provider "aws" {
    region = "us-east-1"
}

data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

locals {
  common_tags = {
    Environment = var.environment_name
    ManagedBy   = "Terraform"
  }
}


resource "aws_instance" "app_server" {
  count         = var.environment_name == "production" ? 2 : 1 # 2 instances in production, 1 in staging
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = var.instance_type
  tags          = merge(local.common_tags, { Name = "${var.environment_name}-app-server-${count.index}" })

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    amazon-linux-extras install docker -y
    service docker start
    systemctl enable docker
    usermod -a -G docker ec2-user

    yum install -y nginx
    systemctl start nginx
    systemctl enable nginx
  EOF
}
