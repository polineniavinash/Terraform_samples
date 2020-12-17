variable "AWS_REGION" {
  default = "us-east-2"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
variable "AMIS" {
  type = "map"
  default = {
    #Amazon linux AMI
    us-east-2 = "ami-02bcbb802e03574ba"
    #us-west-2 = "ami-06b94666"
    #eu-west-1 = "ami-844e0bf7"
  }
}
