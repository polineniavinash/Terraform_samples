provider "aws" {
  region = "us-east-2"
}
module "my_vpc" {
  source = "../Modules/VPC"
  vpc_cidr = "192.168.0.0/16"
  tenancy  = "default"
  vpc_id   = "${module.my_vpc.vpc_id}"
  subnet_cidr = "192.168.1.0/24"
}

module "my_ec2" {
  source = "../Modules/EC2"
  ec2_count = 1
  ami_id = "ami-02bcbb802e03574ba"
  instance_type = "t2.nano"
  subnet_id = "${module.my_vpc.subnet_id}"
}
