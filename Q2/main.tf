provider "aws" {
    region = "us-east-1"  # Set your desired AWS region
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  amip = var.amip # replace this
  instance_typep = var.instance_typep
  subnet_idp =  var.subnet_idp # replace this
}
