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

  attribute {
    name = "batchRequestId"
    type = "S"
  }

  global_secondary_index {
    name            = "batchRequestId-index"
    hash_key        = "batchRequestId"
    projection_type = "ALL"

    read_capacity  = 1
    write_capacity = 1
  }

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}

# active-batches-table
resource "aws_dynamodb_table" "active_batches" {
  name         = "${var.project}-${var.environment}-active-batches-table"
  billing_mode = "PROVISIONED"

  read_capacity  = 1
  write_capacity = 1
  hash_key       = "id"

  attribute {
    name = "batchRequestId"
    type = "S"
  }

  attribute {
    name = "status"
    type = "S"
  }

  global_secondary_index {
    name            = "status-index"
    hash_key        = "status"
    projection_type = "ALL"

    read_capacity  = 1
    write_capacity = 1
  }

  tags = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}
