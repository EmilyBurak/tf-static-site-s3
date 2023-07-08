variable "bucket_name" {
  description = "Name of your app/bucket"
  type        = string
}

variable "region" {
  description = "Region in which to deploy AWS resources"
  default     = "us-west-2"
  type        = string
}

variable "index_page" {
  description = "Index page path for your static website"
  default     = "index.html"
  type        = string
}

variable "error_page" {
  description = "Error page path for your static website."
  default     = "error.html"
  type        = string
}