terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">3.0.0"
    }
  }
}

provider "aws" {
  region = var.region
}


resource "aws_s3_bucket" "bucket" {
  bucket = var.name
  force_destroy = true
}

data "aws_caller_identity" "current" {
}

locals {
    account_id = data.aws_caller_identity.current.account_id
}

resource "aws_s3_bucket_policy" "allow_access_from_this_account" {
  bucket = aws_s3_bucket.bucket.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version: "2012-10-17",
    Statement: [
        {
        Effect: "Allow",
        Action: [
            "s3:GetObject"
        ],
        Resource: ["arn:aws:s3:::${var.name}/*"],
        Principal: {
           "AWS": "arn:aws:iam::${local.account_id}:root"
          }
        }
    ]
  })
}
