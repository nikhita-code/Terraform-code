#Environment
env = "dev"

#VPC 
name = "main_vpc"
vpc_cidr  = "10.0.0.0/16"
vpc_public_cidr = "10.0.1.0/24"
vpc_private_cidr = "10.0.2.0/24"
public_subnet_id  = null   # will be created by VPC module
private_subnet_id = null   # will be created by VPC module
vpc_id            = null   # fresh VPC
igw_id            = null
nat_gateway_id    = null


#Secrity Groups
bastion_cidr = "10.0.1.0/24"
vpc_security_group_ids = []  # will use module outputs


# EC2 / Bastion_host
instance_names = ["nikhita-ec2-1", "nikhita-ec2-2"]
ami = "ami-020cba7c55df1f615" #ubuntu AMI
instance_type = "t2.micro"
key_pair_nm = "taerraform-demo-codespace"
security_group_ids = []        # will use module outputs
subnet_id = " "


#IAM 
role_name = "my-ec2-role"
policy_name   = "my-ec2-policy"
instance_profile_name = "my-ec2-instance-profile"

#RDS
db_instance_identifier = "dev-rds-instance"
db_engine              = "mysql"
db_engine_version      = "8.0.32"
db_instance_class      = "db.t3.micro"
db_alloct_storage      = 20
db_username            =  "RDS_5"
db_password            = "xxyyzz"
db_subnet_group_name   = null   # created dynamically in module

#S3 Bucket
s3_bucket_names = ["nikhita-pass3","nikhita-pass4"]

/*
instance_names = ["nikhita-ec2-1", "nikhita-ec2-2"]
s3_bucket_names = ["nikhita-pass3","nikhita-pass4"]
ami = "ami-020cba7c55df1f615"
instance_type = "t2.micro"
key_pair_nm = "taerraform-demo-codespace"
env = "dev"
name = "main_vpc"
vpc_cidr  = "10.0.0.0/16"
vpc_public_cidr = "10.0.1.0/24"
vpc_private_cidr = "10.0.2.0/24"
bastion_cidr = "10.0.1.50"
role_name = "my-ec2-role"
instance_profile_name = "my-ec2-instance-profile"
db_username = "RDS_5"
db_password = "xxyyzz"
*/
