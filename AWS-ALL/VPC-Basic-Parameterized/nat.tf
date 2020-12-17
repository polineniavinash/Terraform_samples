resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id      = "${element(aws_subnet.Mypublic_subnets.*.id,count.index)}"
  depends_on    = ["aws_internet_gateway.myigw"]

  tags = {
    Name = "myNATigw"
  }
}

resource "aws_route_table" "mynatroute_table" {
  vpc_id = "${aws_vpc.myvpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat-gw.id}"
  }

  tags {
    Name = "myroutetable-private"
  }
}

resource "aws_route_table_association" "Myprivate_RTs" {
  count = "${length(var.private_cidr_subnet)}"
  subnet_id      = "${element(aws_subnet.Myprivate_subnets.*.id,count.index)}"
  route_table_id = "${aws_route_table.mynatroute_table.id}"
}
