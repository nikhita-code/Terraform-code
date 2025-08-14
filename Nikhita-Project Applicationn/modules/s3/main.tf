#Creating the S3 bucket

provider "aws" {
  region = "us-east-1"
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "this" {
   for_each = toset(var.s3_bucket_names)
   bucket = each.value
    
   tags = merge(
      var.tags, { Name = "${each.value}-${var.env}" }
   )
}


