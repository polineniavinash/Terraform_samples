variable "AWS_REGION" {
  default = "us-east-2"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-2 = "ami-0ebbf2179e615c338"  # This is an AMI of AWS Linux in Ohio region
    # us-east-2 = "ami-0c55b159cbfafe1f0"  # This is an AMI of Ubuntu in Ohio region
    # us-west-2 = "ami-06b94666"
    # eu-west-1 = "ami-844e0bf7"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
variable "INSTANCE_USERNAME" {
  default = "ec2-user"
}
