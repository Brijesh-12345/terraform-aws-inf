module "vpc" {
  source = "./modules/vpc"

  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "ec2" {
  source = "./modules/ec2"

  public_subnets = module.vpc.public_subnets
  vpc_id         = module.vpc.vpc_id
  ami_id         = var.ami_id   # ADD THIS
}




module "rds" {
  source = "./modules/rds"

  private_subnets            = module.vpc.private_subnets
  db_username                = var.db_username
  db_password                = var.db_password
  db_name                    = var.db_name
 # db_instance_class_replica  = var.db_instance_class_replica
  db_instance_class_primary  = var.db_instance_class_primary 
}

module "alb_public" {
  source     = "./modules/alb"
  alb_name   = "public-alb"
  subnet_ids = module.vpc.public_subnets
  vpc_id     = module.vpc.vpc_id
  internal   = false
  sg_name    = "alb-sg-public"
}



module "alb_private" {
  source     = "./modules/alb"
  alb_name   = "private-alb"
  subnet_ids = module.vpc.private_subnets
  vpc_id     = module.vpc.vpc_id
  internal   = true
  sg_name    = "alb-sg-private"
}



module "cdn" {
  source = "./modules/cloudfront"
  alb_dns = module.alb_public.alb_dns
}
