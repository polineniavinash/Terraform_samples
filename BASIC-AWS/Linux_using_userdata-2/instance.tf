resource "aws_key_pair" "mykey" {
  key_name = "mykey"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "example" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.mykey.key_name}"

  # provisioner "file" {
  #   source = "script.sh"
  #   destination = "/tmp/script.sh"
  # }
  #
  # provisioner "remote-exec" {
  #   inline = [
  #     "chmod +x /tmp/script.sh",
  #     "sudo -s /tmp/script.sh"
  #   ]
  # }

  provisioner "file" {
     content = "${file("id_rsa")}"
     destination = "/tmp/id_rsa"

  }
  provisioner "remote-exec" {
    inline = [
      "sudo su cat /tmp/id_rsa >>/root/.ssh/authorized_keys",
    ]
  #
  #
  connection {
    type = "ssh"
    user = "${var.INSTANCE_USERNAME}" # ec2-user
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"

  }
  }
}
