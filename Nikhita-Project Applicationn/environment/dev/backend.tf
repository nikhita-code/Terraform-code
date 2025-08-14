
terraform {
backend "s3" {
   bucket = "apple_bucket12345"
   key = "dev/terraform.tfstate"
   region = "us-east-1"
}
