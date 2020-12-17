variable "aws_region" {
  default = "us-east-2"
}
variable "amis" {
  default = {
    us-east-1 = "ami-0d5d9d301c853a04a"
    us-east-2 = "ami-00c03f7f7f2ec15c3"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-844e0bf7"
  }
}
variable "instance_kind" {
  default = "t2.nano"
}
variable "public_key" {
  default = "mykey.pub"
}
variable "machine_name" {
  default = "self_service_linux"
}
variable "developer_name" {
  default = "Avinash"
}
variable "team_name" {
  default = "Cloud team"
}
variable "ingress_port1" {
  default = 22
}
variable "ingress_port2" {
  default = 80
}
variable "ingress_port3" {
  default = 443
}
variable "cidr_block1" {
  default = ["0.0.0.0/0"]
  #You can use your own IP or any specific Ip #Example: 112.23.42.42/32
}
variable "cidr_block2" {
  default = ["0.0.0.0/0"]
  #You can use your own IP or any specific Ip #Example: 112.23.42.42/32
}
variable "cidr_block3" {
  default = ["0.0.0.0/0"]
  #You can use your own IP or any specific Ip #Example: 112.23.42.42/32
}
variable "root_ebs_size" {
  default = 9
  #Instead of 8 we are attaching 16
}
variable "delete_on_termination" {
  default = true
}
variable "ebs_volume_1" {
  default = 15
}
variable "ebs_volume_1_tag" {
  default = "Extra Volume"
}
# variable "iam_role_policy" {
#   default = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#       {
#           "Effect": "Allow",
#           "Action": "s3:*",
#           "Resource": "*"
#       }
#   ]
# }
# EOF
#}
