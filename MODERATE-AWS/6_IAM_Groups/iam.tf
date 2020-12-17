# group definition
resource "aws_iam_group" "administrators" {
    name = "terraformadmin"
}
resource "aws_iam_policy_attachment" "administrators-attach" {
    name = "administrators-terraform"
    groups = ["${aws_iam_group.administrators.name}"]
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
    #The command below will do the same task
    #policy_arn = "${aws_iam_policy.policy.arn}"
}
#policy
# resource "aws_iam_policy" "policy" {
#   name        = "test-policy"
#   description = "A test policy"
# policy = <<EOF
# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Action": "*",
#             "Resource": "*"
#         }
#     ]
# }
# EOF
# }
# user
resource "aws_iam_user" "admin1" {
    name = "admin1"
}
resource "aws_iam_user" "admin2" {
    name = "admin2"
}
resource "aws_iam_group_membership" "administrators-users" {
    name = "administrators-users"
    users = [
        "${aws_iam_user.admin1.name}",
        "${aws_iam_user.admin2.name}",
    ]
    group = "${aws_iam_group.administrators.name}"
}

output "warning" {
    value = "WARNING: make sure you're not using the AdministratorAccess policy for other users/groups/roles. If this is the case, don't run terraform destroy, but manually unlink the created resources"
}
