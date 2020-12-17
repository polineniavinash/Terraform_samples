output "my_public_ip" {
  description = "The Public IP of the instance"
  value = aws_instance.myinstance.*.public_ip
}
