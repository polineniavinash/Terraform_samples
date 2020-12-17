# provider "aws" { # AWS is the Provider
#  region = "${var.aws_region}" # Region Name given by AWS to Ohio region
# }
#
# resource "aws_instance" "Myinstance" {
#   # Variable references had to be wrapped in interpolation syntax
#   ami           = "${var.ami}" # AWS Linux AMI for Ohio region
#   instance_type = "${var.instance_kind}" #Instance capacity
# }
