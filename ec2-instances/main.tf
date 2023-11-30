variable "private_subnet_ids" {
  description = "Liste des IDs de subnet privé"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID pour les instances EC2"
}

variable "desired_capacity" {
  description = "Capacité désiré "
  type        = number
  default     = 2  
}

variable "min_size" {
  description = "capacité min"
  type        = number
  default     = 1 
}

variable "max_size" {
  description = "capacité max"
  type        = number
  default     = 3  
}

resource "aws_launch_configuration" "resto_lc" {
  name_prefix                 = "resto-lc-"
  image_id                    = var.ami_id
  instance_type               = "t2.micro"  
  security_group_names        = [module.security_groups.private_sg_name]  
  lifecycle                   = { create_before_destroy = true }
}

resource "aws_autoscaling_group" "resto_asg" {
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  vpc_zone_identifier = var.private_subnet_ids
  launch_configuration = aws_launch_configuration.resto_lc.id
}

output "asg_name" {
  value = aws_autoscaling_group.resto_asg.name
}

output "asg_id" {
  value = aws_autoscaling_group.resto_asg.id
}

output "asg_desired_capacity" {
  value = aws_autoscaling_group.resto_asg.desired_capacity
}

output "asg_min_size" {
  value = aws_autoscaling_group.resto_asg.min_size
}

output "asg_max_size" {
  value = aws_autoscaling_group.resto_asg.max_size
}