variable "region" {
  default = "us-east-2"
}

variable "env" {
  default = "dev"
}

variable "vpc_cidr_block" {
  default = "192.168.0.0/16"
}

variable "tenancy" {
  default = "default"
}
# variable "subnet_count" {
#   default = "2"
# }

variable "subnet_cidr_blocks" {
  default = "192.168.1.0/24"
}
