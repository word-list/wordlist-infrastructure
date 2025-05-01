
# Call update-batches lambda function every 30 minutes
resource "aws_cloudwatch_event_rule" "update_batches_schedule" {
  name                = "update-batches-schedule"
  description         = "Trigger to update batches on a schedule"
  schedule_expression = "rate(30 minutes)"
}

resource "aws_lambda_permission" "allow_cloudwatch_to_invoke_update_batches" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.update_batches.arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.update_batches_schedule.arn
}

resource "aws_cloudwatch_event_target" "update_batches" {
  rule      = aws_cloudwatch_event_rule.update_batches_schedule.name
  target_id = "update_batches_lambda"
  arn       = aws_lambda_function.update_batches.arn
}
