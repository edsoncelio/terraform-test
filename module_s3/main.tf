resource "random_pet" "name" {}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name == "" ? random_pet.name.id : var.bucket_name
  acl    = "private"

}

locals {
  bucket_name = var.bucket_name == "" ? random_pet.name.id : var.bucket_name
}