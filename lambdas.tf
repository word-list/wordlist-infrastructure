
# Create a Lambda Function
resource "aws_lambda_function" "update_from_source" {
  function_name = "${var.project}-${var.environment}-update-from-source"
  runtime       = "java21"
  handler       = "com.example.Handler::handleRequest"
  role          = aws_iam_role.update_from_source.arn

#   s3_bucket = aws_s3_bucket.deployment_artifacts.bucket
#   s3_key    = var.update_sources_package_key
    filename = "./dummy.jar"

  environment {
    variables = {
      SOURCE_QUEUE_URL  = aws_sqs_queue.update_from_source.id
      SOURCE_TABLE_NAME = aws_dynamodb_table.sources_table.name
    }
  }

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# Create a Lambda Function for validate_words
resource "aws_lambda_function" "validate_words_lambda" {
  function_name = "${var.project}-${var.environment}-validate-words"
  runtime       = "java21"
  handler       = "com.example.ValidateWordsHandler::handleRequest"
  role          = aws_iam_role.validate_words_role.arn

#   s3_bucket = aws_s3_bucket.deployment_artifacts.bucket
#   s3_key    = var.validate_words_package_key
  filename = "./dummy.jar"

  environment {
    variables = {
      WORDS_TABLE_NAME      = aws_dynamodb_table.words_table.name
      WORD_TYPES_TABLE_NAME = aws_dynamodb_table.word_types_table.name
    }
  }

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# Create a Lambda Function for update_words
resource "aws_lambda_function" "update_words_lambda" {
  function_name = "${var.project}-${var.environment}-update-words"
  runtime       = "java21"
  handler       = "com.example.UpdateWordsHandler::handleRequest"
  role          = aws_iam_role.update_words_role.arn

#   s3_bucket = aws_s3_bucket.deployment_artifacts.bucket
#   s3_key    = var.update_words_package_key
  filename = "./dummy.jar"

  environment {
    variables = {
      WORDS_TABLE_NAME = aws_dynamodb_table.words_table.name
    }
  }

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}
