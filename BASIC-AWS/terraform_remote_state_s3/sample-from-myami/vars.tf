variable "AWS_REGION" {
  default = "us-east-2"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-2 = "ami-0653e888ec96eab9b"
    #us-west-2 = "ami-06b94666"
    #eu-west-1 = "ami-844e0bf7"
  }
}
variable "PATH_TO_PRIVATE_KEY" {
  #default = "mykey.ppk"
  default = "Ohio.ppk"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

# variable "ssh_public_key" {
#   default = "${file("id_rsa.pub")}"
# }
