# Environment
env = "qa"

# VPC
name = "main_vpc_qa"
vpc_cidr  = "10.1.0.0/16"
vpc_public_cidr = "10.1.1.0/24"
vpc_private_cidr = "10.1.2.0/24"
public_subnet_id  = null   # will be created by VPC module
private_subnet_id = null   # will be created by VPC module
vpc_id            = null
igw_id            = null
nat_gateway_id    = null

# Security Groups
bastion_cidr = "10.1.1.0/24"
vpc_security_group_ids = []

# EC2 / Bastion_host
instance_names = ["qa-ec2-1", "qa-ec2-2"]
ami = "ami-020cba7c55df1f615" # ubuntu AMI
instance_type = "t2.micro"
key_pair_nm = "terraform-demo-qa"
security_group_ids = []
subnet_id = ""

# IAM
role_name = "qa-ec2-role"
policy_name   = "qa-ec2-policy"
instance_profile_name = "qa-ec2-instance-profile"

# RDS
db_instance_identifier = "qa-rds-instance"
db_engine              = "mysql"
db_engine_version      = "8.0.32"
db_instance_class      = "db.t3.micro"
db_alloct_storage      = 20
db_username            = "RDS_QA"
db_password            = "qa12345"
db_subnet_group_name   = null

# S3 Bucket
s3_bucket_names = ["qa-bucket1","qa-bucket2"]
