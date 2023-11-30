provider "aws" {
  region = var.aws_region
}

resource "aws_route53_zone" "resto" {
  name = var.domain_name
}