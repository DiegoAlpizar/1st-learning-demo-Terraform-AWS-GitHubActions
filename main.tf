terraform {

  # Partial configuration. The other settings (e.g., bucket, region) 
  # will be passed in from a file via -backend-config arguments to 
  # 'terraform init'
  /*backend "s3" {
    
    key = "1st-learning-demo-site/terraform.tfstate"

  }
  */

  required_providers {

    aws = {

      source = "hashicorp/aws"
      //version = "5.6.2"

    }

  }
  
}


provider "aws" {

  region = "us-east-1"
  
}


resource "aws_s3_bucket" "demoWebsite" {

  bucket = "1st-learning-demo-site"

  # Prevent accidental deletion of this S3 bucket
  lifecycle {
    //prevent_destroy = true
  }

}


resource "aws_s3_bucket_public_access_block" "demoWebsite" {
  
  bucket = aws_s3_bucket.demoWebsite.id

  block_public_acls         =   false
  block_public_policy       =   false
  ignore_public_acls        =   false
  restrict_public_buckets   =   false

}
