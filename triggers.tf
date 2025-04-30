resource "aws_lambda_event_source_mapping" "update_sources_sqs_trigger" {
  event_source_arn = aws_sqs_queue.update_from_source.arn
  function_name    = aws_lambda_function.update_from_source.arn
  batch_size       = 10
  enabled          = true
  tags             = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

resource "aws_lambda_event_source_mapping" "query_word_sqs_trigger" {
  event_source_arn = aws_sqs_queue.query_word.arn
  function_name    = aws_lambda_function.query_word.arn
  batch_size       = 10
  enabled          = true
  tags             = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

resource "aws_lambda_event_source_mapping" "update_batch_status_sqs_trigger" {
  event_source_arn = aws_sqs_queue.update_batch_status.arn
  function_name    = aws_lambda_function.update_batch_status.arn  
  enabled          = true
  tags             = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

resource "aws_lambda_event_source_mapping" "update_word_sqs_trigger" {
  event_source_arn = aws_sqs_queue.update_word.arn
  function_name    = aws_lambda_function.update_word.arn
  batch_size       = 50
  enabled          = true
  tags             = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}
