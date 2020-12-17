variable "region" {
  default = "us-east-2"
}

variable "my_public_key" {
  default = "mykey.pub"
}

variable "my_private_key" {
  default = "mykey.ppk"
}

variable "windows_amis" {
  type = "map"
  default = {
    us-east-2 = "ami-080e8abc34651790c"
    us-east-1 = "ami-0246f4914689c475f"
    us-west-2 = "ami-02b648fbefc511117"
  }
}
variable "instance_type" {
  default = "t2.micro"
}
variable "INSTANCE_USERNAME" {
  default = "Terraform"
}
variable "INSTANCE_PASSWORD" {
  default = "Avinash9*9*9*"
}
