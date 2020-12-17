provider "aws" {
    region = var.aws_region
}

resource "aws_instance" "example_ec2" {
  ami = lookup(var.amis, var.aws_region)
  availability_zone = data.aws_availability_zones.available.names[0]
  instance_type = var.instance_kind
  #key_name = "Ohio"
  key_name = aws_key_pair.mykeypair.key_name
  tags = {
       Name       = var.machine_name
       Developer = var.developer_name
       Team = var.team_name
     }
  #security_groups = ["ELK-SG"]
  security_groups = ["${aws_security_group.ports.name}"]
  iam_instance_profile = aws_iam_instance_profile.s3-mybucket-role-instanceprofile.name
  root_block_device{
    volume_size = var.root_ebs_size
    volume_type = "gp2"
    delete_on_termination = var.delete_on_termination # Whether to delete the root block device when the instance gets terminated or not
  }

}
resource "aws_ebs_volume" "ebs-volume-1" {
    availability_zone = data.aws_availability_zones.available.names[0]
    size = var.ebs_volume_1
    type = "gp2"
    tags = {
      Name = var.ebs_volume_1_tag
    }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id = aws_ebs_volume.ebs-volume-1.id
  instance_id = aws_instance.example_ec2.id
  force_detach = true
}

data "aws_availability_zones" "available" {
  state = "available"
}
