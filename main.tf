provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}

resource "aws_s3_bucket" "b" {
  bucket = "amanox-tfcloud-002"
  acl    = "private"

  tags = {
    Name        = "Event"
    Environment = "cncf"
  }
}
