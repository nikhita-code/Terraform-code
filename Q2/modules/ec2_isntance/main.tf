
provider "aws" {
  region = "us-east-1"
}

variable "amip" {
  description = "This is AMI for the instance"
}

variable "instance_typep" {
  description = "This is the instance type, for example: t2.micro"
}

variable "subnet_idp"{
    description = "subnet_id name"
}
/*
resource "aws_instance" "example" {
   
    ami           = var.amip  # Specify an appropriate AMI ID Ubuntu
    instance_type = var.instance_typep
    key_name = "taerraform-demo-codespace"
    subnet_id = var.subnet_idp
   ## iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
    tags = {
        Name = "MyInstance-1"
      } 

}*/

/*
variable "environment" {}
variable "tags" {
  type    = map(string)
  default = {}
}

 locals {
      staging_env = "Nginx_Stage"
      production_env = "Nginx-Prod"
    }

*/

resource "aws_instance" "example" {
  #  count         = var.create_ec2_instance ? 1 : 0
    ami           = var.amip  # Specify an appropriate AMI ID Ubuntu
    instance_type = var.instance_typep
    key_name = "taerraform-demo-codespace"
    subnet_id = var.subnet_idp
  #  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
   
      
    } 
       
       

