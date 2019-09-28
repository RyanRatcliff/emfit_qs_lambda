resource "aws_lambda_function" "emfit_qs_lambda" {
  filename         = "../../target/run.zip"
  function_name    = "emfit_qs_lambda"
  role             = "${aws_iam_role.emfit_qs_lambda.arn}"
  handler          = "src/app.handler"
  source_code_hash = "${filebase64sha256("../../target/run.zip")}"
  runtime          = "nodejs8.10"
  timeout          = 60

  environment {
    variables = {
      EMFIT_USER="${var.emfit_user}",
      EMFIT_PASSWORD="${var.emfit_password}",
      EMFIT_BUCKET="${var.emfit_bucket}"
    }
  }
}
