# IAM Policy Attachment for Update Source Role
resource "aws_iam_role_policy_attachment" "update_source_policy" {
  role       = aws_iam_role.update_sources_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# IAM Policy Attachment for Validate Words Role
resource "aws_iam_role_policy_attachment" "validate_words_policy" {
  role       = aws_iam_role.validate_words_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# IAM Policy Attachment for Update Words Role
resource "aws_iam_role_policy_attachment" "update_words_policy" {
  role       = aws_iam_role.update_words_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Grant Update Source Lambda Access to SQS and DynamoDB
resource "aws_iam_policy" "update_source_sqs_dynamodb_policy" {
  name = "${var.project}-${var.environment}-update-source-sqs-dynamodb-policy"

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
        Resource = aws_sqs_queue.update_source_queue.arn
      },
      {
        Action = [
          "dynamodb:GetItem",
        ]
        Effect   = "Allow"
        Resource = aws_dynamodb_table.sources_table.arn
      }
    ]
  })

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}
resource "aws_iam_role_policy_attachment" "update_source_sqs_dynamodb_policy_attachment" {
  role       = aws_iam_role.update_sources_role.name
  policy_arn = aws_iam_policy.update_source_sqs_dynamodb_policy.arn
}

# Grant Validate Words Lambda Access to SQS and DynamoDB
resource "aws_iam_policy" "validate_words_sqs_dynamodb_policy" {
  name = "${var.project}-${var.environment}-validate-words-sqs-dynamodb-policy"

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
        Resource = aws_sqs_queue.validate_words_queue.arn
      },
      {
        Action = [
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "dynamodb:UpdateItem",
          "dynamodb:DeleteItem"
        ]
        Effect   = "Allow"
        Resource = aws_dynamodb_table.words_table.arn
      }
    ]
  })

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}
resource "aws_iam_role_policy_attachment" "validate_words_sqs_dynamodb_policy_attachment" {
  role       = aws_iam_role.validate_words_role.name
  policy_arn = aws_iam_policy.validate_words_sqs_dynamodb_policy.arn
}

# Grant Update Words Lambda Access to SQS and DynamoDB
resource "aws_iam_policy" "update_words_sqs_dynamodb_policy" {
  name = "${var.project}-${var.environment}-update-words-sqs-dynamodb-policy"

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
        Resource = aws_sqs_queue.update_words_queue.arn
      },
      {
        Action = [
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "dynamodb:UpdateItem",
          "dynamodb:DeleteItem"
        ]
        Effect   = "Allow"
        Resource = aws_dynamodb_table.words_table.arn
      }
    ]
  })

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}
resource "aws_iam_role_policy_attachment" "update_words_sqs_dynamodb_policy_attachment" {
  role       = aws_iam_role.update_words_role.name
  policy_arn = aws_iam_policy.update_words_sqs_dynamodb_policy.arn
}
