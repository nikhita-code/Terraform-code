variable "s3_bucket_names" {
  type = list(string)
}

variable "env" {
  type    = string
  default = "dev"
}

variable "ami" {
   type = string
}
variable "instance_names" {
   type = list(string)
}

variable "instance_type" {
   type = string
}

variable "key_pair_nm" {
    type = string
}

/*
variable "tags" {
    type = map(string)
}  */


variable "vpc_cidr" {
    type = string
}

variable "vpc_id" {
  type = string
}

variable "vpc_public_cidr" {
  type = string
}

variable "vpc_private_cidr" {
   type = string
}

variable "public_subnet_id" {
   type = string
}

variable "private_subnet_id" {
   type = string
}

variable "name" {
  type = string
}

variable "igw_id" {
   type = string
}

variable "nat_gateway_id" {
   type = string
}

variable "name_sg" {
   type = string
   default = "Sg-group"
}

variable "subnet_id" {
   type = string
}
