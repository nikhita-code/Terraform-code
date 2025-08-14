#Creating the S3 bucket

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "sample" {
   for_each = 
   bucket = "nikhita-sample-b1"
   tags = {
      Name = "apple_bucket"
      Environment = "Dev"
   }
}


