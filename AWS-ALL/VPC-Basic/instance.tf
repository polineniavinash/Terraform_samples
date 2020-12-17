resource "aws_instance" "myinstance" {
  ami = "${var.amis}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.Mypublic-1.id}"
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
  key_name = "Ohio"

}
