resource "aws_api_gateway_rest_api" "wordlist" {
  name        = "wordlist"
  description = "API Gateway for Wordlist"

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

// ======================================================================
// sources
// ======================================================================
resource "aws_api_gateway_resource" "api" {
  rest_api_id = aws_api_gateway_rest_api.wordlist.id
  parent_id   = aws_api_gateway_rest_api.wordlist.root_resource_id
  path_part   = "api"
}

resource "aws_api_gateway_resource" "sources" {
  rest_api_id = aws_api_gateway_rest_api.wordlist.id
  parent_id   = aws_api_gateway_resource.api.id  # Reference the "api" resource
  path_part   = "sources"
}

resource "aws_api_gateway_method" "POST_sources" {
  rest_api_id   = aws_api_gateway_rest_api.wordlist.id
  resource_id   = aws_api_gateway_resource.sources.id
  http_method   = "POST"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = aws_api_gateway_authorizer.cognito_auth.id
}

# resource "aws_api_gateway_method" "PUT_sources" {
#   rest_api_id   = aws_api_gateway_rest_api.wordlist.id
#   resource_id   = aws_api_gateway_resource.sources.id
#   http_method   = "PUT"
#   authorization = "COGNITO_USER_POOLS"
#   authorizer_id = aws_api_gateway_authorizer.cognito_auth.id
# }

# resource "aws_api_gateway_method" "DELETE_sources" {
#   rest_api_id   = aws_api_gateway_rest_api.wordlist.id
#   resource_id   = aws_api_gateway_resource.sources.id
#   http_method   = "DELETE"
#   authorization = "COGNITO_USER_POOLS"
#   authorizer_id = aws_api_gateway_authorizer.cognito_auth.id
# }

resource "aws_api_gateway_stage" "stage" {
  rest_api_id   = aws_api_gateway_rest_api.wordlist.id
  deployment_id = aws_api_gateway_deployment.deploy.id
  stage_name    = var.environment

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

resource "aws_api_gateway_deployment" "deploy" {
  depends_on  = [aws_api_gateway_integration.api_update_from_source]
  rest_api_id = aws_api_gateway_rest_api.wordlist.id
}
