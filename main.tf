terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.27"
    }
  }

}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "static_site_bucket" {
  bucket = var.bucket_name
}


resource "aws_s3_bucket_ownership_controls" "static_site_bucket_ownership_controls" {
  bucket = aws_s3_bucket.static_site_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "static_site_bucket_public_access" {
  bucket = aws_s3_bucket.static_site_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "static_site_bucket_policy" {
  bucket = var.bucket_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Principal = "*"
        Action = [
          "s3:GetObject",
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:s3:::${var.bucket_name}",
          "arn:aws:s3:::${var.bucket_name}/*"
        ]
      },
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.static_site_bucket_public_access]
}

resource "aws_s3_bucket_website_configuration" "static_site_bucket_website_config" {
  bucket = var.bucket_name
  index_document {
    suffix = var.index_page
  }

  error_document {
    key = var.error_page
  }
}
