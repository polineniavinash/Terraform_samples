output "my_public_ip" {
  description = "The Public IP of the instance"
  value = module.my_ec2.my_public_ip
}
