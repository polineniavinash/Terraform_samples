resource "aws_iam_role" "s3-mybucket-role" {
    name = "s3-mybucket-role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "s3-mybucket-role-instanceprofile" {
    name = "s3-mybucket-role"
    role = aws_iam_role.s3-mybucket-role.name
}

# resource "aws_iam_role_policy" "s3-mybucket-role-policy" {
#     name = "s3-mybucket-role-policy"
#     role = aws_iam_role.s3-mybucket-role.id
#     policy = var.iam_role_policy
# }
#Instead of using above code we can use below snippet of coe

resource "aws_iam_policy_attachment" "administrators-attach" {
    name = "S3-read-access"
    roles = ["${aws_iam_role.s3-mybucket-role.name}"]
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
