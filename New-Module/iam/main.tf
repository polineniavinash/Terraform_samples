provider "aws" {
    region = var.aws_region
}
# group definition
resource "aws_iam_group" "group1" {
    name = var.group_name
}
resource "aws_iam_policy_attachment" "s3read-attach" {
    name = "s3read-attach"
    groups = ["${aws_iam_group.group1.name}"]
    #policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
    policy_arn = var.policy_arn
}
# user
resource "aws_iam_user" "user1" {
    name = var.user_1
    tags = {
         Name        = var.developer_name
         Team = var.team_name
       }

}
resource "aws_iam_user_login_profile" "example" {
  user    = aws_iam_user.user1.name
  pgp_key = "keybase:avinashpolineni"
}
resource "aws_iam_access_key" "access_key" {
  user = aws_iam_user.user1.name
}
resource "aws_iam_group_membership" "add-users" {
    name = "self_service_users"
    users = [
        aws_iam_user.user1.name,
    ]
    group = aws_iam_group.group1.name
}
