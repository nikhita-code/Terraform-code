
variable "vpc_id" {
  type = string
}

variable "vpc_public_cidr" {
  type = list(string)
}

variable "vpc_private_cidr" {
   type = list(string)
}

varible "public_subnet_id" {
   type = list(string)
}

variable "private_subnet_id" {
   type = list(string)
}

variable "name" {
  type = string
}

variable "tags" {
  type = map(string)
}
