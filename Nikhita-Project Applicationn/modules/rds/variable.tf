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


variable "tags" {
  type = map(string)
}

variable "env" {
  type = string
  default =  "dev"
}
