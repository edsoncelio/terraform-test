provider "aws" {
  region = "us-east-1"

    default_tags {
    tags = {
      Environment = "Test"
      CreatedBy = "Terraform"
    }
  }
}