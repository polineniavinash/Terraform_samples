provider "aws" {
    region = "${var.AWS_REGION}"
}

resource "aws_instance" "example" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.nano"
  key_name = "Ohio"
  #key_name = "${aws_key_pair.mykeypair.key_name}"
  #key_name = "${aws_key_pair.mykey.key_name}"
  #subnet_id   = "subnet-028d7c6b"
   tags = {
    Name = "Instance_ELK_Terraform"
  }

  #security_groups = ["${aws_security_group.allow-tcp.id}"]
  security_groups = ["ELK-SG"]
  provisioner "file" {
    source = "/Linux_using_Userdata/script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
  }
    connection {
      # type     = "ssh"
      # timeout = "10m"
      user = "ec2-user"
      #private_key = "${file("dummy")}"
      private_key = "${file("Ohio")}"
      #private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
      #host = "${self.public_ip}"
      host = self.public_ip
    }
}

output "private_ip" {

  value = "${aws_instance.example.private_ip}"

}

output "public_ip"{

  value = "${aws_instance.example.public_ip}"
}
