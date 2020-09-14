provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}

locals {
  bucket_name = "amanox-tfcloud-003"
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = local.bucket_name
  acl    = "public-read"
  source = "index.html"
  website {
    index_document = var.index_document
    error_document = var.error_document
  }
  tags = {
    Name        = "Event"
    Environment = "cncf"
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket       = local.bucket_name
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "error" {
  bucket       = local.bucket_name
  key          = "error.html"
  source       = "error.html"
  content_type = "text/html"
}
