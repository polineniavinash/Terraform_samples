variable "vpc_name" {
  description = "VPC Name"
  default = "myvpc"
}

variable "auto_create_subnetworks" {
  default     = "false"
  description = "false = creates custom VPC, true = automatically creates subnets in each region"
}

variable "public_subnet_range" {
  default = "10.1.0.0/20"
}
variable "private_subnet_range" {
  default = "10.2.0.0/20"
}

# variable "instance_name" {
#   default = "test"
#   description = "Instance name"
# }

variable "instance_type" {
  default = "n1-standard-1"
  description = "Instance type"
}
variable "instance_zone" {
  default = "us-central1-a"
  description = "Instance location"
}
variable "script" {
  default = "scripts"
}
