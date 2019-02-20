resource "aws_cloudwatch_event_rule" "every_24_hours" {
  name = "every-24-hours"
  description = "Fires every 24 hours"
  schedule_expression = "cron(0, 17, *, *, ?, *)"
}

resource "aws_cloudwatch_event_target" "check_emfit_qs_every_24_hours" {
  rule = "${aws_cloudwatch_event_rule.every_24_hours.name}"
  target_id = "check_foo"
  arn = "${aws_lambda_function.emfit_qs_lambda.arn}"
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_check_emfit_qs_every_24_hours" {
  statement_id = "AllowExecutionFromCloudWatch"
  action = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.emfit_qs_lambda.function_name}"
  principal = "events.amazonaws.com"
  source_arn = "${aws_cloudwatch_event_rule.every_24_hours.arn}"
}