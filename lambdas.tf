
# update-from-source lambda
resource "aws_lambda_function" "update_from_source" {
  function_name = "${var.project}-${var.environment}-update-from-source"
  runtime       = "java21"
  handler       = "tech.gaul.wordlist.updatefromsource.App::handleRequest"
  role          = aws_iam_role.update_from_source.arn

  s3_bucket = var.use_dummy_handlers ? null : aws_s3_bucket.deployment_artifacts.bucket
  s3_key    = var.use_dummy_handlers ? null : var.update_from_source_package_key
  filename  = var.use_dummy_handlers ? "./dummy.jar" : null

  environment {
    variables = {
      SOURCE_QUEUE_URL  = aws_sqs_queue.update_from_source.id
      SOURCE_TABLE_NAME = aws_dynamodb_table.sources_table.name
    }
  }

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# query-word lambda
resource "aws_lambda_function" "query_word" {
  function_name = "${var.project}-${var.environment}-query-word"
  runtime       = "java21"
  handler       = "tech.gaul.wordlist.queryword.App::handleRequest"
  role          = aws_iam_role.query_word.arn

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

# update-batch lambda
resource "aws_lambda_function" "update-batch" {
  function_name = "${var.project}-${var.environment}-update-batch"
  runtime       = "java21"
  handler       = "tech.gaul.wordlist.updatebatch.App::handleRequest"
  role          = aws_iam_role.update_batch.arn

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

# update-word lambda
resource "aws_lambda_function" "update-word" {
  function_name = "${var.project}-${var.environment}-update-word"
  runtime = "java21"
  handler = "tech.gaul.wordlist.updateword.App::handleRequest"
  role = aws_iam_role.update_word.arn

  filename = "./dummy.jar"

  environment {

  }

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}