#VPC creation with
resource "aws_vpc" "myvpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags = {
    Name = "myvpc"
  }
}

resource "aws_subnet" "Mypublic-1" {
  vpc_id                  = "${aws_vpc.myvpc.id}"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-2a"

  tags = {
    Name = "mypublic_subnet-1"
  }
}

resource "aws_subnet" "Mypublic-2" {
  vpc_id                  = "${aws_vpc.myvpc.id}"
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-2b"

  tags = {
    Name = "mypublic_subnet-2"
  }
}

resource "aws_subnet" "Myprivate-1" {
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "10.0.3.0/24"

  #By default map_public_ip_on_launch is false . Mentioned casually
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-2a"

  tags = {
    Name = "myprivate_subnet-1"
  }
}

resource "aws_subnet" "Myprivate-2" {
  vpc_id                  = "${aws_vpc.myvpc.id}"
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-2b"

  tags = {
    Name = "myprivate_subnet-2"
  }
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = "${aws_vpc.myvpc.id}"

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "myroutetable" {
  vpc_id = "${aws_vpc.myvpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.myigw.id}"
  }

  tags = {
    Name = "main"
  }
}

resource "aws_route_table_association" "Mypublic_RT1" {
  subnet_id      = "${aws_subnet.Mypublic-1.id}"
  route_table_id = "${aws_route_table.myroutetable.id}"
}

resource "aws_route_table_association" "Mypublic_RT2" {
  subnet_id      = "${aws_subnet.Mypublic-2.id}"
  route_table_id = "${aws_route_table.myroutetable.id}"
}
