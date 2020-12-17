output "user_name"{
  value = aws_iam_user.user1.name
}
output "access_key"{
  value = aws_iam_access_key.access_key.id
}
output "secret_key" {
  value = aws_iam_access_key.access_key.secret
}
output "password"{
  value = aws_iam_user_login_profile.example.encrypted_password
}
