locals {
  common_tags = {
    #Environment =  var.env
    Project = "FTR" 
  }
} 


module s3 {
   source = "../../modules/s3"
   env = var.env
   s3_bucket_names = var.s3_bucket_names
   tags = local.common_tags

}
