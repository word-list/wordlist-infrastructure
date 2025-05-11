
# update-from-source lambda role
resource "aws_iam_role" "update_from_source" {
  name = "${var.project}-${var.environment}-update-from-source-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# query-word lambda role
resource "aws_iam_role" "query_words" {
  name = "${var.project}-${var.environment}-query-words-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# update-batches lambda role
resource "aws_iam_role" "check_batches_for_update" {
  name = "${var.project}-${var.environment}-check-batches-for-update-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# update-batch-status lambda role
resource "aws_iam_role" "update_batch_status" {
  name = "${var.project}-${var.environment}-update-batch-status-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# update-word lambda role
resource "aws_iam_role" "update_word" {
  name = "${var.project}-${var.environment}-update-word-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}
