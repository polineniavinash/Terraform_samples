resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.Mypublic-1.id}"
  depends_on    = ["aws_internet_gateway.myigw"]

  tags = {
    Name = "gw NAT"
  }
}

resource "aws_route_table" "mynatroute_table" {
  vpc_id = "${aws_vpc.myvpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat-gw.id}"
  }

  tags {
    Name = "main-private-1"
  }
}

resource "aws_route_table_association" "main-private-1-a" {
  subnet_id      = "${aws_subnet.Myprivate-1.id}"
  route_table_id = "${aws_route_table.mynatroute_table.id}"
}

resource "aws_route_table_association" "main-private-2-a" {
  subnet_id      = "${aws_subnet.Myprivate-2.id}"
  route_table_id = "${aws_route_table.mynatroute_table.id}"
}
