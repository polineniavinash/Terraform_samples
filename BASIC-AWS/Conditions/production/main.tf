provider "aws" {
  region = "us-east-2"
}
module "my_vpc" {
  source = "../Modules/VPC"
  #Here the below env variable is used to create a env only if it production . Other than that it will be failed(dev)
  env = "production"
  vpc_cidr_block = "10.0.0.0/16"
  tenancy  = "default"
  subnet_cidr_blocks = "10.0.1.0/24"
}
