provider "aws" {
  alias  = "cognito"
  region = "eu-west-3"  
}

resource "aws_cognito_identity_pool" "example_cognito_pool" {
  provider = aws.cognito

  identity_pool_name = "identity-pool"
  allow_unauthenticated_identities = true
}

resource "aws_cognito_user_pool" "user_pool" {
  provider = aws.cognito

  
  name                     = "user-pool"
  alias_attributes         = ["email"]
  auto_verified_attributes = ["email"]

  schema {
    name = "email"
    attribute_data_type = "String"
    required = true
  }

  schema {
    name = "password"
    attribute_data_type = "String"
    required = true
  }

  password_policy {
    minimum_length    = 8
    require_lowercase = true
    require_numbers   = true
    require_symbols   = true
    require_uppercase = true
  }
}