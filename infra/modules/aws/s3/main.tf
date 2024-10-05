resource "aws_s3_bucket" "example" {
  bucket = "${var.namespace}-${var.environment}-${var.app_prefix}"

  object_lock_enabled = false

  versioning {
    enabled = true
  }

  tags = {
    Owner       = "Forrest Miller"
    Email       = "forrestmillerj@gmail.com"
    Environment = var.environment
  }
}

# resource "aws_s3_bucket_object" "example" {
#   bucket = aws_s3_bucket.example.id
#   key    = ""
#   source = ""
#
#   etag = filemd5("")
# }
