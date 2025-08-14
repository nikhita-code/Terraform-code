
variable "s3_bucket_names" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}

variable "env" {
  type = string
  default =  "dev"
}
