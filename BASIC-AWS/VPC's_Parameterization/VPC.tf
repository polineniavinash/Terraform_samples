provider "aws" {
  region = "${var.regions}"
}
resource "aws_vpc" "myvpc" {
  cidr_block = "${var.vpc_cidr_block}"
  instance_tenancy = "default"
  tags {
    Name = "myvpc"
  }
}
resource "aws_subnet" "subnets" {
  #count = "${length(var.azs)}"
  count = "${length(data.aws_availability_zones.azs.names)}"
  availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
  cidr_block = "${element(var.subnets_cidr_blocks,count.index)}"
  vpc_id = "${aws_vpc.myvpc.id}"
  tags {
    Name = "subnet-${count.index+1}"
  }

}
