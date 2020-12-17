provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "VPC-Terraform"
  }

}
resource "aws_subnet" "mysubnet1" {
  vpc_id = "${aws_vpc.myvpc.id}"
  cidr_block = "10.0.1.0/24"
  tags {
    Name = "Public-Subnet-TF"
  }

}
