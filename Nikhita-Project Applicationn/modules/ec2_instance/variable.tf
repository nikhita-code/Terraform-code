variable "ami" {
   type = string
}
variable "isntance_names" {
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
