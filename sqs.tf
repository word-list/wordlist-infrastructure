# update-from-souce queue
resource "aws_sqs_queue" "update_from_source" {
  name                       = "${var.project}-${var.environment}-update-from-source-queue"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# query-word queue
resource "aws_sqs_queue" "query_words" {
  name                       = "${var.project}-${var.environment}-query-words-queue"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# update-batch-status queue
resource "aws_sqs_queue" "update_batch_status" {
  name                       = "${var.project}-${var.environment}-update-batch-status-queue"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# update-word queue
resource "aws_sqs_queue" "update_word" {
  name                       = "${var.project}-${var.environment}-update-word-queue"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}