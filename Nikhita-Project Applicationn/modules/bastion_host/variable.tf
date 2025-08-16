
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

variable "tags" {
    type = map(string)
    default = {
       Environment =  "dev"
       Project = "FTR" 
    }
}

variable "env" {
    type = string
    default = "dev"
}

variable "vpc_security_group_ids" {
  type = list(string)
  default = null
}

variable "subnet_id" {
  type = string
}

variable "public_subnet_id" {
   type = string
   default  = null
}

/*
variable "instance_name" {
   type = string
}
*/
