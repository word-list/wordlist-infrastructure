resource "aws_cognito_user_pool" "user_pool" {
  name                     = "${var.project}-${var.environment}-user-pool"
  auto_verified_attributes = ["email"]

  schema {
    attribute_data_type = "String"
    name                = "email"
    required            = true
  }

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

resource "aws_cognito_user_pool_client" "user_pool_client" {
  name                         = "${var.project}-${var.environment}-app-client"
  user_pool_id                 = aws_cognito_user_pool.user_pool
  generate_secret              = false
  allowed_oauth_flows          = ["code", "implicit"]
  allowed_oauth_scopes         = ["openid", "email", "profile"]
  supported_identity_providers = ["COGNITO"]  
}

resource "aws_api_gateway_authorizer" "cognito_auth" {
  name            = "${var.project}-${var.environment}-cognito-authoriser"
  rest_api_id     = aws_api_gateway_rest_api.wordlist.id
  type            = "COGNITO_USER_POOLS"
  identity_source = "method.request.header.Authorization"
  provider_arns   = [aws_cognito_user_pool.user_pool]
}
