# Create a new load balancer
resource "aws_elb" "myelb" {
  name = "MyELB"

  #  availability_zones = "${element(var.azs,count.index)}"
  #subnets         = ["${aws_subnet.mysubnets.*.id}"] - This is for version 0.11.14
  subnets         = "${aws_subnet.mysubnets.*.id}"
  security_groups = ["${aws_security_group.mysg_elb.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/index.html"
    interval            = 30
  }

  #instances                   = ["${aws_instance.webservers.*.id}"] -This is for version 0.11.14
  instances                   = "${aws_instance.webservers.*.id}"
  cross_zone_load_balancing   = true
  idle_timeout                = 100
  connection_draining         = true
  connection_draining_timeout = 300

  tags = {
    Name = "Myelb-terraform"
  }
}
