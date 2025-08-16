variable "vpc_id" {
  type = string
  default  = null
}

variable "vpc_public_cidr" {
  type = string
}

variable "vpc_private_cidr" {
   type = string
}

variable "bastion_cidr" {
   type = string
}
