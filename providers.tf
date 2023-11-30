terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.28.0"
    }
  }
}

provider "aws" {
  region     = "eu-west-3"  
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}


provider "aws" {
  alias      = "cognito"  
  region     = "eu-west-3"  
}

provider "aws" {
  alias      = "rds"  
  region     = "eu-west-3"  
}

provider "aws" {
  alias      = "waf"  
  region     = "eu-west-3" 
}