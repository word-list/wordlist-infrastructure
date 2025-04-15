
resource "aws_servicecatalogappregistry_application" "wordlist_application" {
  name        = "${var.project}-${var.environment}-application"
  description = "Application resource"
}

