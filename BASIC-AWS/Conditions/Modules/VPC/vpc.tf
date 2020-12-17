provider "aws" {
  region = "${var.region}"
}


resource "aws_vpc" "myvpc" {
  count = "${var.env == "production" ? 1 : 0}"
  #count = 1
  cidr_block = "${var.vpc_cidr_block}"
  instance_tenancy = "${var.tenancy}"
  tags {
    Name = "myvpc"
    Appname = "myapp"
  }
}

resource "aws_subnet" "subnets" {
  #count = "${var.subnet_count}"
  cidr_block = "${var.subnet_cidr_blocks}"
  vpc_id = "${aws_vpc.myvpc.id}"
tags {
  Name = "subnet1"
}

}
