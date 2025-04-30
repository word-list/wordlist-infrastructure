resource "aws_lambda_event_source_mapping" "update_sources_sqs_trigger" {
  event_source_arn = aws_sqs_queue.update_from_source.arn
  function_name    = aws_lambda_function.update_source_lambda.arn
  batch_size       = 10
  enabled          = true
  tags             = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

resource "aws_lambda_event_source_mapping" "validate_words_sqs_trigger" {
  event_source_arn = aws_sqs_queue.validate_words_queue.arn
  function_name    = aws_lambda_function.validate_words_lambda.arn
  batch_size       = 10
  enabled          = true
  tags             = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}
resource "aws_lambda_event_source_mapping" "update_words_sqs_trigger" {
  event_source_arn = aws_sqs_queue.update_words_queue.arn
  function_name    = aws_lambda_function.update_words_lambda.arn
  batch_size       = 10
  enabled          = true
  tags             = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}
