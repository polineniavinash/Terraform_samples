resource "aws_security_group" "Webserver_SG" {
  name        = "allow_ssh_and_http"
  description = "security group that allows ssh and httpd ports"

  ingress { # SSH port opening
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress { # HTTP port opening
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress { # Allowing all the outbound traffic to the outside world.
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Webserver_SG"
  }
}
