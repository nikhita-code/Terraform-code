terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-<env>"
    key            = "path/to/my/state/staging/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "my-terraform-lock-table"
  }
}
