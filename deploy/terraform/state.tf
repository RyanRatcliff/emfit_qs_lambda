terraform {
  backend "s3" {
    bucket = "mystatebaucket"
    key    = "emfit-qs-lambda-state"
    region = "us-east-1"
  }
}