
variable "vpc_id" {
  type = string
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
