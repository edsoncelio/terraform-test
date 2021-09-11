terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }
  }
}


locals {
  region      = "us-east-1"
}

module "main" {
  source = "../.."
}

resource "test_assertions" "bucket_checks" {
  component = "bucket"

  equal "bucket_region" {
    description = "bucket region"
    got         = module.main.bucket_region
    want        = local.region
  }
}

