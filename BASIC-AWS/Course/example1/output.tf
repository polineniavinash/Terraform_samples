output "My_public_ip" {
  description = "The public IP address of the web server"
  #value = "${aws_instance.Myinstance.*.private_ip}" - This line of code was used in earlier version(0.11)
  value = aws_instance.Myinstance.*.public_ip
}
output "My_private_ip" {
  description = "The private IP address of the web server"
  #value = "${aws_instance.Myinstance.*.private_ip}" - This line of code was used in earlier version(0.11)
  value = aws_instance.Myinstance.*.private_ip
}
