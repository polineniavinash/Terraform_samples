resource "aws_launch_configuration" "example-launchconfig" {
  name_prefix          = "example-launchconfig"
  image_id             = lookup(var.amis,var.aws_region)
  instance_type        = "t2.micro"
  key_name             = aws_key_pair.mykeypair.key_name
  security_groups      = [aws_security_group.myinstance.id]
  user_data = file("User_data.sh")
  lifecycle              { create_before_destroy = true }
}

resource "aws_autoscaling_group" "example-autoscaling" {
  name                 = "example-autoscaling"
  vpc_zone_identifier  = aws_subnet.Mypublic_subnets.*.id

  launch_configuration = aws_launch_configuration.example-launchconfig.name
  min_size             = 2
  max_size             = 2
  health_check_grace_period = 300
  health_check_type = "ELB"
  load_balancers = [aws_elb.my-elb.name]
  force_delete = true

  tag {
      key = "Name"
      value = "ec2 instance"
      propagate_at_launch = true
  }
}
