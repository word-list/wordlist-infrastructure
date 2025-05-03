# read/write update-from-source-queue policy
resource "aws_iam_policy" "sqs_rw_update_from_source_policy" {
  name = "${var.project}-${var.environment}-sqs-rw-update-from-source"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sqs:SendMessage",
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ]
        Effect   = "Allow"
        Resource = aws_sqs_queue.update_from_source.arn
      }
    ]
  })

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# read sources-table policy
resource "aws_iam_policy" "db_r_sources_policy" {
  name = "${var.project}-${var.environment}-db-r-sources"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "dynamodb:GetItem",
        ]
        Effect   = "Allow"
        Resource = aws_dynamodb_table.sources.arn
      }
    ]
  })

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# read/write query-word-queue policy
resource "aws_iam_policy" "sqs_rw_query_word_policy" {
  name = "${var.project}-${var.environment}-sqs-rw-query-word"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sqs:SendMessage",
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ]
        Effect   = "Allow"
        Resource = aws_sqs_queue.query_word.arn
      }
    ]
  })

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# read/write active-queries-table policy
resource "aws_iam_policy" "db_rw_active_queries_policy" {
  name = "${var.project}-${var.environment}-db-rw-active-queries"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "dynamodb:UpdateItem",
          "dynamodb:DeleteItem"
        ]
        Effect   = "Allow"
        Resource = aws_dynamodb_table.active_queries.arn
      }
    ]
  })

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# read/write update-batch-status-queue policy
resource "aws_iam_policy" "sqs_rw_update_batch_status" {
  name = "${var.project}-${var.environment}-sqs-rw-update-batch-status"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sqs:SendMessage",
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ]
        Effect   = "Allow"
        Resource = aws_sqs_queue.update_batch_status.arn
      }
    ]
  })

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# read/write update-word-queue policy
resource "aws_iam_policy" "sqs_rw_update_word_queue_policy" {
  name = "${var.project}-${var.environment}-sqs-rw-update-word-queue"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sqs:SendMessage",
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ]
        Effect   = "Allow"
        Resource = aws_sqs_queue.update_word.arn
      }
    ]
  })

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# read/write completed-queries-table policy
resource "aws_iam_policy" "db_rw_completed_queries_policy" {
  name = "${var.project}-${var.environment}-db-rw-completed-queries"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "dynamodb:UpdateItem",
          "dynamodb:DeleteItem"
        ]
        Effect   = "Allow"
        Resource = aws_dynamodb_table.completed_queries.arn
      }
    ]
  })

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# read/write words-table policy
resource "aws_iam_policy" "db_rw_words_policy" {
  name = "${var.project}-${var.environment}-db-rw-words"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "dynamodb:UpdateItem",
          "dynamodb:DeleteItem"
        ]
        Effect   = "Allow"
        Resource = aws_dynamodb_table.words.arn
      }
    ]
  })

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# read/write active-batches-table policy
resource "aws_iam_policy" "db_rw_active_batches_policy" {
  name = "${var.project}-${var.environment}-db-rw-active-batches"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "dynamodb:UpdateItem",
          "dynamodb:DeleteItem"
        ]
        Effect   = "Allow"
        Resource = aws_dynamodb_table.active_batches.arn
      }
    ]
  })

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}


# Policy assignments

## update-from-source lambda policy attachments
resource "aws_iam_role_policy_attachment" "update_from_source" {
  role       = aws_iam_role.update_from_source.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "update_from_source_sqs_rw_update_from_source" {
  role       = aws_iam_role.update_from_source.name
  policy_arn = aws_iam_policy.sqs_rw_update_from_source_policy.arn
}

resource "aws_iam_role_policy_attachment" "update_from_source_db_r_sources" {
  role       = aws_iam_role.update_from_source.name
  policy_arn = aws_iam_policy.db_r_sources_policy.arn
}

resource "aws_iam_role_policy_attachment" "update_from_source_sqs_rw_query_word" {
  role       = aws_iam_role.update_from_source.name
  policy_arn = aws_iam_policy.sqs_rw_query_word_policy.arn
}

## query-word lambda policy attachments
resource "aws_iam_role_policy_attachment" "query_word" {
  role       = aws_iam_role.query_word.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "query_word_sqs_rw_query_word" {
  role       = aws_iam_role.query_word.name
  policy_arn = aws_iam_policy.sqs_rw_query_word_policy.arn
}

resource "aws_iam_role_policy_attachment" "query_word_db_rw_active_queries" {
  role       = aws_iam_role.query_word.name
  policy_arn = aws_iam_policy.db_rw_active_queries_policy.arn
}

## update-batches lambda policy attachments
resource "aws_iam_role_policy_attachment" "update_batches" {
  role       = aws_iam_role.update_batches.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "update_batches_sqs_rw_update_batch_status" {
  role       = aws_iam_role.update_batches.name
  policy_arn = aws_iam_policy.sqs_rw_update_batch_status.arn
}

resource "aws_iam_role_policy_attachment" "update_batches_db_rw_active_queries" {
  role       = aws_iam_role.update_batches.name
  policy_arn = aws_iam_policy.db_rw_active_queries_policy.arn
}

resource "aws_iam_role_policy_attachment" "update_batches_db_rw_active_batches" {
  role       = aws_iam_role.update_batches.name
  policy_arn = aws_iam_policy.db_rw_active_batches_policy.arn
}

## update-batch-status lambda policy attachments
resource "aws_iam_role_policy_attachment" "update_batch_status" {
  role       = aws_iam_role.update_batch_status.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "update_batch_status_sqs_rw_update_batch_status" {
  role       = aws_iam_role.update_batch_status.name
  policy_arn = aws_iam_policy.sqs_rw_update_batch_status.arn
}

resource "aws_iam_role_policy_attachment" "update_batch_status_sqs_rw_query_word" {
  role       = aws_iam_role.update_batch_status.name
  policy_arn = aws_iam_policy.sqs_rw_query_word_policy.arn
}

resource "aws_iam_role_policy_attachment" "update_batch_status_sqs_rw_update_word_queue" {
  role       = aws_iam_role.update_batch_status.name
  policy_arn = aws_iam_policy.sqs_rw_update_word_queue_policy.arn
}

resource "aws_iam_role_policy_attachment" "update_batch_status_db_rw_active_queries" {
  role       = aws_iam_role.update_batch_status.name
  policy_arn = aws_iam_policy.db_rw_active_queries_policy.arn
}

resource "aws_iam_role_policy_attachment" "update_batch_status_db_rw_completed_queries" {
  role       = aws_iam_role.update_batch_status.name
  policy_arn = aws_iam_policy.db_rw_completed_queries_policy.arn
}

resource "aws_iam_role_policy_attachment" "update_batch_status_db_rw_active_batches" {
  role       = aws_iam_role.update_batch_status.name
  policy_arn = aws_iam_policy.db_rw_active_batches_policy.arn
}

## update-word lambda policy attachments
resource "aws_iam_role_policy_attachment" "update_word" {
  role       = aws_iam_role.update_word.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "update_word_sqs_rw_update_word" {
  role       = aws_iam_role.update_word.name
  policy_arn = aws_iam_policy.sqs_rw_update_word_queue_policy.arn
}

resource "aws_iam_role_policy_attachment" "update_word_db_rw_words" {
  role       = aws_iam_role.update_word.name
  policy_arn = aws_iam_policy.db_rw_words_policy.arn
}