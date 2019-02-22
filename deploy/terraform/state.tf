terraform {
  backend "s3" {
    bucket = "mystatebucket"
    key    = "emfit-qs-lambda-state"
    region = "us-east-1"
  }
}
