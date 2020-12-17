variable "region" {
  default = "us-east-2"
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "tenancy" {
  default = "default"
}


# NOTE:  As of now Terraform does not support interpolation for the back end


# variable "bucket" {
#   default = "avinashbuck"
# }
#
# variable "path_to_bucket" {
#   default = "Terraform_state_file/terraform.tfstate"
# }
#
# variable "bucket_region" {
#   default = "ap-south-1"
# }
