provider "aws" {
  region = "eu-west-1"
}


resource "aws_s3_bucket" "bucket" {
  bucket = var.name
  force_destroy = true

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    A_NEW_TAG = "NEW TAG"
  }
}
