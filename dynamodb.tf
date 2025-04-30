# sources-table
resource "aws_dynamodb_table" "sources" {
  name         = "${var.project}-${var.environment}-sources-table"
  billing_mode = "PROVISIONED"

  read_capacity  = 1
  write_capacity = 1
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# word-types-table
resource "aws_dynamodb_table" "word_types" {
  name         = "${var.project}-${var.environment}-word-types-table"
  billing_mode = "PROVISIONED"

  read_capacity  = 1
  write_capacity = 1
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# words-table
resource "aws_dynamodb_table" "words" {
  name         = "${var.project}-${var.environment}-words-table"
  billing_mode = "PROVISIONED"

  read_capacity  = 2
  write_capacity = 2
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# active-queries-table
resource "aws_dynamodb_table" "active_queries" {
  name         = "${var.project}-${var.environment}-active-queries-table"
  billing_mode = "PROVISIONED"

  read_capacity  = 1
  write_capacity = 1
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# completed-queries-table
resource "aws_dynamodb_table" "completed_queries" {
  name         = "${var.project}-${var.environment}-completed-queries-table"
  billing_mode = "PROVISIONED"

  read_capacity  = 1
  write_capacity = 1
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}