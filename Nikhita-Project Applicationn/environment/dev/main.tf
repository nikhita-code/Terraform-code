locals = {
  common_tags = {
    Environment =  var.env
    Project = "FTR" 
  }
}

modules s3 {
   source = "../../modules/s3"
   s3_bucket_names = var.s3_bucket_names
   common_tags = locals.common_tags
}
