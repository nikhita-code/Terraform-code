# Environment
env = "prod"

# VPC
name = "main_vpc_prod"
vpc_cidr  = "10.2.0.0/16"
vpc_public_cidr = "10.2.1.0/24"
vpc_private_cidr = "10.2.2.0/24"
public_subnet_id  = null
private_subnet_id = null
vpc_id            = null
igw_id            = null
nat_gateway_id    = null

# Security Groups
bastion_cidr = "10.2.1.0/24"
vpc_security_group_ids = []

# EC2 / Bastion_host
instance_names = ["prod-ec2-1", "prod-ec2-2"]
ami = "ami-020cba7c55df1f615" # ubuntu AMI
instance_type = "t3.micro"
key_pair_nm = "terraform-demo-prod"
security_group_ids = []
subnet_id = ""

# IAM
role_name = "prod-ec2-role"
policy_name   = "prod-ec2-policy"
instance_profile_name = "prod-ec2-instance-profile"

# RDS
db_instance_identifier = "prod-rds-instance"
db_engine              = "mysql"
db_engine_version      = "8.0.32"
db_instance_class      = "db.t3.medium"
db_alloct_storage      = 50
db_username            = "RDS_PROD"
db_password            = "prod12345"
db_subnet_group_name   = null

# S3 Bucket
s3_bucket_names = ["prod-bucket1","prod-bucket2"]
