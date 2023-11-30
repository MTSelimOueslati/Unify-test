variable "public_subnet_ids" {
  description = "Liste des IDs de subnet privé"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID pour les instances EC2"
}

resource "aws_instance" "resto_instance_public" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_ids[0]  

  tags = {
    Name = "resto-instance-public"
  }
}