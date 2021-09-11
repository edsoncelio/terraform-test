output "bucket_name" {
    value = local.bucket_name
    description = "bucket name"
}

output "bucket_region" {
  value = aws_s3_bucket.bucket.region
  description = "bucket region"
}