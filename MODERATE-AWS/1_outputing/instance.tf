resource "aws_instance" "myinstance" {
  ami = "${lookup(var.AMIS,var.region)}"
  instance_type = "t2.micro"
  tenancy = "default"
  provisioner "local-exec" {
    command = "echo ${aws_instance.myinstance.private_ip} >> privateIPs.txt"

  }

}
output "ip" {
  value="${aws_instance.myinstance.public_ip}"
}
