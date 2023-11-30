provider "aws" {
  region = "eu-west-3"  
}

resource "aws_cloudfront_distribution" "example_distribution" {

  origin {
    domain_name = "your-ec2-instance-public-dns-or-ip"
    origin_id   = "EC2-instance-origin"
  }

  enabled             = true
  is_ipv6_enabled     = true

}