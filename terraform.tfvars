vpc_cidr = "10.0.0.0/16"
aws_region = "us-east-1"


azs = [
  "us-east-1a",
  "us-east-1b"
]

public_subnets = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_subnets = [
  "10.0.3.0/24",
  "10.0.4.0/24"
]

ami_id   = "ami-0b6c6ebed2801a5cb"
key_name = "my-keypair"


# EC2
#ec2_instance_type_1 = "t2.micro"
ec2_instance_type_2 = "t2.small"

# RDS
db_instance_class_primary  = "db.t3.micro"
#db_instance_class_replica  = "db.t3.micro"

db_username = "admin"
db_password = "StrongPassword123!"
db_name     = "appdb"

# ALB
public_alb_name  = "public-alb"
private_alb_name = "internal-alb"

# CloudFront
cdn_enabled = true

# TAGS
environment = "dev"
project     = "TerraformInfra"
