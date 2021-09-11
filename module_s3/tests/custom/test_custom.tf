terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

resource "random_pet" "name" {}

locals {
  bucket_name = random_pet.name.id
  region      = "us-east-1"
}

module "main" {
  source = "../.."
  bucket_name = random_pet.name.id
}

resource "test_assertions" "bucket_checks" {
  component = "bucket"

  equal "bucket_name" {
    description = "bucket name"
    got         = module.main.bucket_name
    want        = local.bucket_name
  }
}

