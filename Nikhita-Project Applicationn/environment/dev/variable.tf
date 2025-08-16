#s3 bucket module variables
variable "s3_bucket_names" {
  type = list(string)
}

variable "env" {
  type    = string
  default = "dev"
}

#ec2_instance module variables
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

#vpc and sg module variables
variable "name_sg" {
   type = string
   default = "Sg-group"
}

variable "subnet_id" {
   type = string
}

variable "bastion_cidr" {
   type = string
}


variable "vpc_cidr" {
    type = string
}


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

variable "public_subnet_id" {
   type = string
   default  = null
}

variable "private_subnet_id" {
   type = string
   default  = null
}

variable "name" {
  type = string
}

/*variable "tags" {
  type = map(string)
}
*/
variable "igw_id" {
   type = string
   default  = null
}

variable "nat_gateway_id" {
   type = string
   default  = null
}

#IAM role variables
variable "role_name" {
    type = string
}
variable "policy_name" {
    type = string
    default     = "my-ec2-policy"
}
variable "policy_file" {
    type = string
    default  = "policy.json"
}
variable "instance_profile_name" {
    type = string
    default   = "my-ec2-instance-profile"
}

#rds_db module variables
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
  type    = list(string)
}
variable "security_group_ids" {
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A map of tags to apply to resources"
  type        = map(string)
  default = {
    Name        = "app-server"
    Environment = "dev"
  }
}

