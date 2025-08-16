variable "db_instance_identifier" {
    type = string
    default = "my-db-instance"
}

variable "db_engine" {
    type = string 
    default = "mysql"
}

variable "db_engine_version" {
    type = string
    default = "8.0.32"
}

variable "db_instance_class" {
    type = string
    default = "db.t3.micro"
}

variable "db_alloct_storage" {
   type = number
   default = 20
}

variable "db_username" {
    type = string
}

variable "db_password" {
    type = string
    sensitive = true
}

variable "db_subnet_group_name" { 
   type = string 
}

variable "vpc_security_group_ids" {
  type = list(string)
  default = null
}

variable "tags" {
  description = "A map of tags to apply to resources"
  type        = map(string)
  default = {
    Name        = "app-server"
    Environment = "dev"
  }
}
variable "env" {
  type = string
  default =  "dev"
}

variable "public_subnet_id" {
   type = string
   default  = null
}

variable "private_subnet_id" {
   type = string
   default  = null
}
