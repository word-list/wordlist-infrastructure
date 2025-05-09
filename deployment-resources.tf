resource "aws_s3_bucket" "deployment_artifacts" {
  bucket = "${var.project}-${var.environment}-deployment-artifacts-bucket"
  tags   = aws_servicecatalogappregistry_application.wordlist_application.application_tag
}


resource "aws_s3_bucket_policy" "deployment_artifacts" {
  bucket = aws_s3_bucket.deployment_artifacts.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowSSLRequestsOnly"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.deployment_artifacts.arn,
          "${aws_s3_bucket.deployment_artifacts.arn}/*"
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = false
          }
        }
      }
    ]
  })
}
