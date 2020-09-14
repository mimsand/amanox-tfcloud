provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}

locals {
  bucket_name = "amanox-tfcloud-005"
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = local.bucket_name
  acl    = "public-read"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
  tags = {
    Name        = "Event"
    Environment = "cncf"
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket       = local.bucket_name
  depends_on   = [aws_s3_bucket.example_bucket]
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
  acl    = "public-read"
}

resource "aws_s3_bucket_object" "error" {
  bucket       = local.bucket_name
  depends_on   = [aws_s3_bucket.example_bucket]
  key          = "error.html"
  source       = "error.html"
  content_type = "text/html"
  acl    = "public-read"
}

output "website_url" {
  value = aws_s3_bucket.example_bucket
}
