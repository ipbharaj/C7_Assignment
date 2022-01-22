
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIARE3OO2RJ4HNMO35Z"
  secret_key = "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"
}

resource "aws_s3_bucket" "b" {
  bucket = "c7assingment"
  acl    = "private"

  tags = {
    Name        = "inderpreet-c7bucker"
    Environment = "Dev"
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Owner = "inderpreet.singh"
    Name  = "assignment-course7"
  }
}