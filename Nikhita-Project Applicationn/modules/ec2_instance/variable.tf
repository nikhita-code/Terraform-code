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
}

variable "env" {
    type = string
    default = "dev"
}

variable "subnet_id" {
   type = string
}

variable "vpc_security_group_ids" {
   type = list(string)
}

variable "security_group_ids" {
   type = list(string)
}

variable "instance_profile_name" {
    type = string
    default   = "my-ec2-instance-profile"
}

variable "iam_instance_profile" {
  type = string
}

variable "public_subnet_id" {
   type = string
   default  = null
}

variable "private_subnet_id" {
   type = string
   default  = null
}
