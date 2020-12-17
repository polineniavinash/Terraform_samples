resource "aws_security_group" "ports" {
  name        = "sg_self_service"
  description = "security group that allows ssh and all egress traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.ingress_port1
    to_port     = var.ingress_port1
    protocol    = "tcp"
    cidr_blocks = var.cidr_block
  }
  ingress {
    from_port   = var.ingress_port2
    to_port     = var.ingress_port2
    protocol    = "tcp"
    cidr_blocks = var.cidr_block
  }
  ingress {
    from_port   = var.ingress_port3
    to_port     = var.ingress_port3
    protocol    = "tcp"
    cidr_blocks = var.cidr_block
  }
  tags = {
    Name = "allow-ssh"
  }
}
