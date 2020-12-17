provider "aws" {
  region = "us-east-2"
}

module "my_vpc" {
  source      = "../Modules/VPC"
  vpc_cidr    = "192.168.0.0/16"
  tenancy     = "default"
  vpc_id      = "${module.my_vpc.vpc_id}" # This is for earlier version of 0.11
  subnet_cidr = "192.168.2.0/24"
}

module "my_ec2" {
  source    = "../Modules/EC2"
  ec2_count = 2
  #Here we can give some other ami id
  ami_id        = "ami-02bcbb802e03574ba"
  instance_type = "t2.micro"
  subnet_id     = "${module.my_vpc.subnet_id}"
}
