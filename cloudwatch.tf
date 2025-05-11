
# Call update-batches lambda function every 30 minutes
resource "aws_cloudwatch_event_rule" "check_batches_for_update_schedule" {
  name                = "check-batches-for-update-schedule"
  description         = "Trigger to update batches on a schedule"
  schedule_expression = "rate(30 minutes)"
}

resource "aws_lambda_permission" "allow_cloudwatch_to_invoke_check_batches_for_update" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.check_batches_for_update.arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.check_batches_for_update_schedule.arn
}

resource "aws_cloudwatch_event_target" "check_batches_for_update" {
  rule      = aws_cloudwatch_event_rule.check_batches_for_update_schedule.name
  target_id = "check-batches-for-update-lambda"
  arn       = aws_lambda_function.check_batches_for_update.arn
}
