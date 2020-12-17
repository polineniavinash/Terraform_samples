resource "aws_vpc" "myvpc" {
  cidr_block       = "${var.cidr_vpc}"
  instance_tenancy = "default"

  tags = {
    Name = "VPC_Terraform"
  }
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = "${aws_vpc.myvpc.id}"

  tags = {
    Name = "IGW_Terraform"
  }
}

resource "aws_subnet" "mysubnets" {
  #count                   = "${length(var.cidr_subnet)}"
  count  = "${length(data.aws_availability_zones.azs.names)}"
  vpc_id = "${aws_vpc.myvpc.id}"

  #availability_zone       = "${element(var.azs,count.index)}"
  availability_zone       = "${element(data.aws_availability_zones.azs.names, count.index)}"
  cidr_block              = "${element(var.cidr_subnet, count.index)}"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "subnet-${count.index + 1}"
  }
}

resource "aws_route_table" "myroutetable" {
  vpc_id = "${aws_vpc.myvpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.myigw.id}"
  }

  tags = {
    Name = "RouteTable_Terraform"
  }
}

resource "aws_route_table_association" "myroutetableassociation" {
  count          = "${length(var.cidr_subnet)}"
  subnet_id      = "${element(aws_subnet.mysubnets.*.id, count.index)}"
  route_table_id = "${aws_route_table.myroutetable.id}"
}
