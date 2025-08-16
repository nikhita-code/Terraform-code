
output "s3_bucket_names" {
  value = [ for b in aws_s3_bucket.this : b.bucket  ]
}
