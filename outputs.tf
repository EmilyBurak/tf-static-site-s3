output "static_site_endpoint" {
  value = aws_s3_bucket_website_configuration.s3BucketWebsiteConfig.website_endpoint
}