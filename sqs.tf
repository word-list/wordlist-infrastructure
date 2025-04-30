# update-from-souce queue
resource "aws_sqs_queue" "update_from_source" {
  name                       = "${var.project}-${var.environment}-update-from-source-queue"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# query-word queue
resource "aws_sqs_queue" "query_word" {
  name                       = "${var.project}-${var.environment}-query-word-queue"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# update-batch queue
resource "aws_sqs_queue" "update_batch" {
  name                       = "${var.project}-${var.environment}-update-batch-queue"
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