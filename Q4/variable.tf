/* 
variable "amip" {
  description = "ec2 value"
}

variable "instance_typep" {
  description = "instance value"
}

variable "subnet_idp"{
    description = "subnet_id name"
}*/


variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "environment_name" {
  description = "Name of the environment (staging or production)"
  type        = string
}
