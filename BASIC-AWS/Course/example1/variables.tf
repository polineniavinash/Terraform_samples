variable "aws_region" {
  description = "Region ID of the AWS"
  default     = "us-east-2"
}
# variable "azs" {
#    type    = "list"
#    description = "Here is the list of three subnets in Ohio region"
#    default = ["us-east-2a","us-east-2b","us-east-2c"]
# }
data "aws_availability_zones" "azs" {} # Alternative of the above "azs" block
variable "ami_id" {
  type        = "map"
  description = "ID's of the AMI to deploy with respect to region"
  default = {
    us-east-2 = "ami-0d8f6eb4f641ef691" # AWS Linux-2 AMI for Ohio region
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-844e0bf7"
  }
}
variable "instance_kind" {
  type        = "string"
  description = "very small instance in the AWS instances category"
  default     = "t2.nano"
}
variable "mykey" {
  type        = "map"
  description = "We are using predefined key pairs for our instances with respect to the AWS regions"
  default = {
    us-east-2 = "Ohio"
    us-west-2 = "Mykey_for_us_west_2"
    eu-west-1 = "mykeypair"
  }
}
