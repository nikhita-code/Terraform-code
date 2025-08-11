variable "amip" {
  description = "ec2 value"
}

variable "instance_typep" {
  description = "instance value"
}

variable "subnet_idp"{
    description = "subnet_id name"
}
/*
variable "create_ec2_instance" {
  description = "Set to true to create the EC2 instance"
  type        = bool
  default     = false
}
*/
/*
variable "vpc_cidrp" {
  description = "cidr block range"
  type        = string
  default = "10.0.0.0/16"
}

variable "vpc_public_cidp" {
  description = "public cidr range"
  type        = string
  default = "10.0.1.0/24"
}

variable "vpc_private_cidrp" {
  description = "private cidr range"
  type        = string
  default = "10.0.2.0/24"
}

*/

/*
variable "instance_config" {
     description = "each ec2 instance description"
     type = map(object({
        amip = string
        instance_typep = string
        subnet_idp = string
        tagsp = map(string)
    }))

    default = {
      "instance-1" = {
           amip = "ami-020cba7c55df1f615"
           instance_typep = "t2.micro"
           subnet_idp = "subnet-0d1b6989a71c7c662"   
           tagsp         = { Name = "Webserver-1" }     
      },
    "instance-2" = {
           amip = "ami-020cba7c55df1f615"
           instance_typep = "t2.micro"
           subnet_idp = "subnet-0d1b6989a71c7c662"   
           tagsp         = { Name = "Webserver-2" }     
      },
    "instance-3" = {
           amip = "ami-020cba7c55df1f615"
           instance_typep = "t2.micro"
           subnet_idp = "subnet-0d1b6989a71c7c662"   
           tagsp         = { Name = "Webserver-3" }     
      }
    }
}
*/
