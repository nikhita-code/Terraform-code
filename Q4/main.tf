provider "aws" {
  region = "us-east-1"
}

variable "ami" {
  description = "value"
}

/*
variable "instance_type" {
  description = "value"
  type = map(string)

  default = {
    "dev" = "t2.micro"
    "stage" = "t2.medium"
    "prod" = "t2.xlarge"
  }
}
*/

variable "instance_type"{
  description = "creating"
  type = map(string)

  default = {
    "dev" = "t2.micro"
    "stage" = "t2.micro"
    "prod" = "t2.micro"
  }

}
/*
module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami = var.amip
  instance_type = lookup(var.instance_type, terraform.workspace, "t2.medium")
}

*/

module "ec2_instance" {
  source = "./modules/ec2_instance"
  amip = var.amip # replace this
  instance_typep = var.instance_typep
  subnet_idp =  var.subnet_idp # replace this
}
