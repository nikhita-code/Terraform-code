variable "env" {
    type = string
    default = "dev"
}

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

variable "tags" {
  type = map(string)
}

variable "igw_id" {
   type = string
}

variable "nat_gateway_id" {
   type = string
}
