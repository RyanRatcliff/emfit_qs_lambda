resource "aws_s3_bucket" "ryan-emq-fit-data" {
  bucket = "ryan-emq-fit-data"
  acl    = "private"

  tags = {
    Name        = "ryan-emq-fit-data"
    Environment = "Dev"
  }
}