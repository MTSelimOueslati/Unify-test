variable "aws_access_key" {
  description = "AWS access key"
}

variable "aws_secret_key" {
  description = "AWS secret key"
}

variable "aws_region" {
  description = "The AWS region to deploy resources"
  default     = "eu-west-3"  
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "192.168.0.0/16"
}

variable "subnet_cidrs" {
  description = "CIDR blocks for subnets"
  type        = list(string)
  default     = ["192.168.0.0/17", "192.168.128.0/17"]
}

variable "availability_zones" {
  description = "Availability zones for subnets"
  type        = list(string)
  default     = ["eu-west-3a", "eu-west-3b"]
}

variable "map_public_ip_on_launch" {
  description = "Map public IP on launch for public subnets"
  type        = bool
  default     = true
}

variable "rds_engine" {
  description = "Database engine for RDS"
  default     = "mysql"
}

variable "rds_instance_type" {
  description = "Instance type for RDS"
  default     = "db.t2.micro"
}
