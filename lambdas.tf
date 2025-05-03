
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
      SOURCES_TABLE_NAME   = aws_dynamodb_table.sources.name
      QUERY_WORD_QUEUE_URL = aws_sqs_queue.query_word.url
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

  s3_bucket = var.use_dummy_handlers ? null : aws_s3_bucket.deployment_artifacts.bucket
  s3_key    = var.use_dummy_handlers ? null : var.query_word_package_key
  filename  = var.use_dummy_handlers ? "./dummy.jar" : null

  environment {
    variables = {
      ACTIVE_QUERIES_TABLE_NAME = aws_dynamodb_table.active_queries.name
      ACTIVE_BATCHES_TABLE_NAME = aws_dynamodb_table.active_batches.name
    }
  }

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# update-batches lambda
resource "aws_lambda_function" "update_batches" {
  function_name = "${var.project}-${var.environment}-update-batches"
  runtime       = "java21"
  handler       = "tech.gaul.wordlist.updatebatches.App::handleRequest"
  role          = aws_iam_role.update_batches.arn

  s3_bucket = var.use_dummy_handlers ? null : aws_s3_bucket.deployment_artifacts.bucket
  s3_key    = var.use_dummy_handlers ? null : var.update_batches_package_key
  filename  = var.use_dummy_handlers ? "./dummy.jar" : null

  environment {
    variables = {
      ACTIVE_QUERIES_TABLE_NAME     = aws_dynamodb_table.active_queries.name
      ACTIVE_BATCHES_TABLE_NAME     = aws_dynamodb_table.active_batches.name
      UPDATE_BATCH_STATUS_QUEUE_URL = aws_sqs_queue.update_batch_status.url
    }
  }

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# update-batch lambda
resource "aws_lambda_function" "update_batch_status" {
  function_name = "${var.project}-${var.environment}-update-batch-status"
  runtime       = "java21"
  handler       = "tech.gaul.wordlist.updatebatch.App::handleRequest"
  role          = aws_iam_role.update_batch_status.arn

  s3_bucket = var.use_dummy_handlers ? null : aws_s3_bucket.deployment_artifacts.bucket
  s3_key    = var.use_dummy_handlers ? null : var.update_batch_status_package_key
  filename  = var.use_dummy_handlers ? "./dummy.jar" : null

  environment {
    variables = {
      ACTIVE_QUERIES_TABLE_NAME = aws_dynamodb_table.active_queries.name
      ACTIVE_BATCHES_TABLE_NAME = aws_dynamodb_table.active_batches.name
      QUERY_WORD_QUEUE_URL      = aws_sqs_queue.query_word.url
      UPDATE_WORD_QUEUE_URL     = aws_sqs_queue.update_word.url
    }
  }

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# update-word lambda
resource "aws_lambda_function" "update_word" {
  function_name = "${var.project}-${var.environment}-update-word"
  runtime       = "java21"
  handler       = "tech.gaul.wordlist.updateword.App::handleRequest"
  role          = aws_iam_role.update_word.arn

  s3_bucket = var.use_dummy_handlers ? null : aws_s3_bucket.deployment_artifacts.bucket
  s3_key    = var.use_dummy_handlers ? null : var.update_word_package_key
  filename  = var.use_dummy_handlers ? "./dummy.jar" : null

  environment {
    variables = {

    }
  }

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}
