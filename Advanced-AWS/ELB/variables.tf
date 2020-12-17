variable "regions" {
  default = "us-east-2"
}

variable "cidr_vpc" {
  default = "10.0.0.0/16"
}

variable "cidr_subnet" {
  type    = "list"
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

# variable "azs" {
#   type    = "list"
#   default = ["us-east-2a", "us-east-2b"]
# }

# Declare the data source
data "aws_availability_zones" "azs" {}

#
# variable "amis"{
#   type = "map"
#   default = {
#     us-east-2 = "ami-02bcbb802e03574ba"
#     us-east-1 = "ami-0de53d8956e8dcf80"
#   }
# }
variable "amis" {
  default = "ami-02bcbb802e03574ba"
}

variable "tenancy" {
  default = "default"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "keys" {
  default = "Ohio"
}

# variable "userdata" {
#   type = "map"
#   default = {
#     10.0.1.0/24 = "${file("User_data1.sh")}"
#     10.0.2.0/24 = "${file("User_data2.sh")}"
#     10.0.3.0/24 = "${file("User_data3.sh")}"
#
#   }
# }

