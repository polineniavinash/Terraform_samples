resource "aws_instance" "webservers" {
  count = "${length(var.cidr_subnet)}"

  #ami             = "${lookup(var.amis,var.regions)}"
  ami             = "${var.amis}"
  tenancy         = "${var.tenancy}"
  instance_type   = "${var.instance_type}"
  key_name        = "${var.keys}"
  security_groups = ["${aws_security_group.mysg_webservers.id}"]
  subnet_id       = "${element(aws_subnet.mysubnets.*.id,count.index)}"

  user_data = "${file("User_data.sh")}"

  #user_data = "${lookup(var.userdata,var.cidr_subnet)}"

  tags = {
    Name = "2server-${count.index+1}"
  }
}
