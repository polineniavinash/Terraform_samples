variable "regions" {
  default = "us-east-2"
}
variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}
variable "subnets_cidr_blocks" {
  type="list"
  default = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
}
#variable "azs" {
#  type="list"
#  default = ["us-east-2a","us-east-2b","us-east-2c"]
#}

# Declare the data source
data "aws_availability_zones" "azs" {}
