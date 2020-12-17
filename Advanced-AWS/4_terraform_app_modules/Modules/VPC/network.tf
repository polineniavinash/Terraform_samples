provider "aws" {
  region = var.region
}

resource "aws_vpc" "myvpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.tenancy
  tags = {
    Name = "Myvpc"
  }
}

resource "aws_subnet" "mysubnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr
  map_public_ip_on_launch = var.public_ip_mapping
  tags = {
    Name = "Mysubnet"
  }

}
