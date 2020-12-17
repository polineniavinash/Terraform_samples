variable "AWS_REGION" {
  default = "us-east-2"
}
variable "AMIS" {
  type = "map"
  default = {
    #us-east-2 = "ami-0d5d9d301c853a04a"
    us-east-2 = "ami-00c03f7f7f2ec15c3"
    #us-west-2 = "ami-06b94666"
    #eu-west-1 = "ami-844e0bf7"
  }
}
variable "PATH_TO_PRIVATE_KEY" {
  #default = "dummy"
  default = "Ohio"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "dummy.pub"
}
variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

# variable "ssh_public_key" {
#   default = "${file("id_rsa.pub")}"
# }
