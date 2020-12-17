resource "aws_instance" "myinsance" {
  ami           = "${lookup(var.amis, var.aws_region)}"
  instance_type = "${var.instance_type}"

  # the VPC subnet
    subnet_id      = "${element(aws_subnet.Mypublic_subnets.*.id,count.index)}"
    # If you want the instance in the second subnet use the below line of code
    #subnet_id      = "${element(aws_subnet.Mypublic_subnets.*.id,count.index+1)}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"
  #key_name = "Ohio"

  # This block below add's 16 GB instead of 8 GB
  root_block_device{
    volume_size = 16
    volume_type = "gp2"
    delete_on_termination = true # Whether to delete the root block device when the instance gets terminated or not
  }
  tags = {
    Name = "My_instance_with_EBS"
  }
}

resource "aws_ebs_volume" "ebs-volume-1" {
    availability_zone = "us-east-2a"
    size = 20
    type = "gp2"
    tags = {
        Name = "extra volume data"
    }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id = "${aws_ebs_volume.ebs-volume-1.id}"
  instance_id = "${aws_instance.myinsance.id}"
}
