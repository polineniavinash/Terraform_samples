variable "region" {
  default = "us-east-2"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "tenancy" {
  default = "default"
}

variable "vpc_id" {}

variable "subnet_cidr" {
  default = "10.0.1.0/24"
}
variable "public_ip_mapping" {
  default = true
}