variable "aws_region" {
  default = "us-east-2"
}

variable "group_name" {
  default = "self_service_group"
}

variable "user_1" {
  default = "self_service_user-1"
  # description = "The name must consist of upper and lowercase alphanumeric
  # characters with no spaces. You can also include any of the following
  # characters: =,.@-_.. User names are not distinguished by case.
  # For example, you cannot create users named both TESTUSER and testuser"
}
variable "policy_arn" {
  default = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
#
variable "developer_name" {
  default = "Avinash"
}
variable "team_name" {
  default = "Cloud team"
}
variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
