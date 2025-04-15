# Create a DynamoDB Table
resource "aws_dynamodb_table" "sources_table" {
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

# Create a DynamoDB Table for Word Types
resource "aws_dynamodb_table" "word_types_table" {
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

# Create a DynamoDB Table for Words
resource "aws_dynamodb_table" "words_table" {
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
