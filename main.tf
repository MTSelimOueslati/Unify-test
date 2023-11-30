provider "aws" {
  region = "eu-west-3" 
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "route53" {
  source = "./route53"
}

module "cloudfront" {
  source = "./cloudfront"
}

module "cognito" {
  source = "./cognito"
}

module "waf" {
  source = "./waf"
}

module "rds" {
  source     = "./rds"
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.subnets.private_subnet_ids
}

module "ec2_instances" {
  source              = "./ec2-instances"
  private_subnet_ids  = module.subnets.private_subnet_ids
  ami_id             = "ami-12345678"  # A CHANGER!!!!!!!!!!!!!
}

module "ec2_instances_public" {
  source            = "./ec2-instances-public"
  public_subnet_ids = module.subnets.public_subnet_ids
  ami_id            = "ami-12345678"  # A CHANGER!!!!!!!!!!!!!
}

module "subnets" {
  source             = "./vpc"
  vpc_id             = module.vpc.vpc_id
  availability_zones = module.vpc.availability_zones
  public_cidrs       = module.vpc.public_subnets_cidrs
  private_cidrs      = module.vpc.private_subnets_cidrs
}

module "security_groups" {
  source = "./vpc"
  vpc_id = module.vpc.vpc_id
}