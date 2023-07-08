# AWS Static S3 Website Terraform Module

- A Terraform module for provisioning a (simple) static website hosted on AWS S3, because I couldn't find a good current example in a bit of googling for this use case.

## TO DO

- Add Cloudfront, domain/route 53, etc etc.

## Notes

- I attempted to be able to include a `src` folder with an `index.html` and `error.html` in it and set those pages up automagically but it
  did not play well with the `aws_s3_bucket_website_configuration` resource type as I'd set it up, even erasing the static website hosting setting.
  Worth investigating more.
  - Accordingly, you'll have to add your own `index.html` and `error.html` to the bucket after provisioning to get content on the static site.
- It will in fact not let you `terraform destroy` if the S3 bucket is not empty, which is behavior as intended, but difficult.

## Credits

- https://github.com/GeminiWind/terraform-aws-static-website
- https://dev.to/aws-builders/build-a-static-website-using-s3-route-53-with-terraform-1ele
- https://stackoverflow.com/questions/76419099/access-denied-when-creating-s3-bucket-acl-s3-policy-using-terraform
- Terraform docs
