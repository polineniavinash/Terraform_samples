provider "aws" {
  region = "${var.region}"
}

#storing the versioned terraform.tfstate file in the s3 bucket
terraform {
  backend "s3" {
    bucket = "avinashbuck"
    key    = "Terraform_state_file/terraform.tfstate"
    region = "ap-south-1" # Bucket location
    dynamodb_table = "terraform_state_lock" # First create a db table in the same region of bucket
  }
}

resource "aws_vpc" "myvpc" {

  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.tenancy}"

tags = {
  Name = "MyVPC"
}
}
