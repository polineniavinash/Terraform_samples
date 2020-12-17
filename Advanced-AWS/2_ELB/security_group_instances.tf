resource "aws_security_group" "mysg_instance" {
  vpc_id      = "${aws_vpc.myvpc.id}"
  name        = "allow_ssh_http"
  description = "security group for my instance"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["${aws_security_group.mysg_elb.id}"]
  }

  tags = {
    Name = "myinstance"
  }
}

resource "aws_security_group" "mysg_elb" {
  name        = "allow_http"
  description = "Allow http inbound traffic"
  vpc_id      = "${aws_vpc.myvpc.id}"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    #Above is to specific to port 80 (tcp)
    #protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http_for_webservers"
  }
}
