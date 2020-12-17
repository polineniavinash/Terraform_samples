provider "aws" {
    region = "${var.AWS_REGION}"
}

#   key_name = "mykey"
#   public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
# }

resource "aws_instance" "example" {
  ami = "ami-0c7b9e7fe946a67ad"
  #ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.medium"
 key_name = "Ohio"
  #key_name = "${aws_key_pair.mykeypair.key_name}"
  #key_name = "${aws_key_pair.mykey.key_name}"
  #subnet_id   = "subnet-028d7c6b"
   tags = {
    Name = "Instance_ELK_Terraform"
  }

  #security_groups = ["${aws_security_group.allow-tcp.id}"]
  security_groups = ["ELK-SG"]
  # provisioner "file" {
  #   source = "script.sh"
  #   destination = "/tmp/script.sh"
  # }

  # provisioner "file" {
  #   content = "${file("id_rsa")}"
  #   destination = "/root/.ssh/authorized_keys"
  # }
#   provisioner "remote-exec" {
#     inline = [
#       "chmod +x /tmp/script.sh",
#       "sudo /tmp/script.sh"
#     ]
#   }
#   connection {
#     type     = "ssh"
#     timeout = "10m"
#     user = "${var.INSTANCE_USERNAME}"
#     #private_key = "${file(var.PATH_TO_PRIVATE_KEY)}"
#     private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
#   }
}

output "private_ip" {

  value = "${aws_instance.example.private_ip}"

}

output "public_ip"{

  value = "${aws_instance.example.public_ip}"
}
