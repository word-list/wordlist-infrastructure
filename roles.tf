
# IAM Role for Lambda Execution
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

# IAM Role for Validate Words
resource "aws_iam_role" "validate_words_role" {
  name = "${var.project}-${var.environment}-validate-words-role"

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

# IAM Role for Update Words
resource "aws_iam_role" "update_words_role" {
  name = "${var.project}-${var.environment}-update-words-role"

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
