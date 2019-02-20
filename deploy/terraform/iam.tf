resource "aws_iam_role" "emfit_qs_lambda" {
  name = "emfit_qs_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "emfit_qs_lambda_s3_access" {
  name = "emfit_qs_lambda_s3_access"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::ryan-emq-fit-data/*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "emfit_qs_lambda_s3_access" {
  role      = "${aws_iam_role.emfit_qs_lambda.name}"
  policy_arn = "${aws_iam_policy.emfit_qs_lambda_s3_access.arn}"
}

