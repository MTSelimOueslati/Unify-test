output "cloudfront_distribution_domain" {
  value = module.cloudfront.cloudfront_distribution_domain
}

output "cognito_user_pool_id" {
  value = module.cognito.cognito_user_pool_id
}