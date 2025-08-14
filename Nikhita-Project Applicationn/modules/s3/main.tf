#Creating the S3 bucket

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "this" {
   for_each = toset(var.s3_bucket_names)
   bucket = var.each
   tags = merge{
      var.tags, "Name" = "${each.value}-${var.env}"
   }
}


