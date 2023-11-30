provider "aws" {
  alias  = "rds"
  region = "eu-west-3"  
}

resource "aws_db_instance" "resto_rds" {
  provider = aws.rds

  engine        = var.rds_engine
  instance_class = var.rds_instance_type

}