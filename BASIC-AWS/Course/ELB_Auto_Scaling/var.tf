variable "aws_region" {
  default = "us-east-2"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "tenancy" {
  default = "default"
}

variable "dns_support" {
  default = "true"
}

variable "dns_hostnames" {
  default = "true"
}

variable "classiclink" {
  default = "false"
}

variable "public_ip_mapping" {
  default = "true"
}

variable "public_cidr_subnet" {
  type    = "list"
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_cidr_subnet" {
  type    = "list"
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "instance_type" {
  default = "t2.nano"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "amis" {
  type = "map"

  default = {
    #Amazon linux AMI
    us-east-2 = "ami-02bcbb802e03574ba"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-844e0bf7"
  }
}

# variable "azs" {
#   type    = "list"
#   default = ["us-east-2a", "us-east-2b"]
# }

data "aws_availability_zones" "azs" {}
