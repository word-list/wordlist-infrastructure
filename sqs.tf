# Create an SQS Queue
resource "aws_sqs_queue" "update_from_source" {
  name                       = "${var.project}-${var.environment}-update-from-source-queue"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# Create a queue for validating words
resource "aws_sqs_queue" "validate_words_queue" {
  name                       = "${var.project}-${var.environment}-validate-words-queue"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# Create a queue for updating words
resource "aws_sqs_queue" "update_words_queue" {
  name                       = "${var.project}-${var.environment}-update-words-queue"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}
