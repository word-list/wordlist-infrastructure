# POST sources/update  lambda
resource "aws_lambda_function" "api_update_from_source" {
  function_name = "${var.project}-${var.environment}-api-update-from-source"
  runtime       = "java21"
  handler       = "tech.gaul.wordlist.api.updatefromsource.App::handleRequest"
  role          = aws_iam_role.update_from_source.arn

  s3_bucket = var.use_dummy_handlers ? null : aws_s3_bucket.deployment_artifacts.bucket
  s3_key    = var.use_dummy_handlers ? null : var.api_update_from_source_package_key
  filename  = var.use_dummy_handlers ? "./dummy.jar" : null

  environment {
    variables = {
      SOURCES_TABLE_NAME    = aws_dynamodb_table.sources.name
      QUERY_WORDS_QUEUE_URL = aws_sqs_queue.query_words.url
    }
  }

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}
