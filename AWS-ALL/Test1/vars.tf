variable "AWS_REGION" {
  default = "us-east-2"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-2 = "ami-00c79db59589996b9"
  }
}
# variable "PATH_TO_PRIVATE_KEY" {
#   default = "Ohio.ppk"
# }
# variable "INSTANCE_USERNAME" {
#   default = "ec2-user"
# }
