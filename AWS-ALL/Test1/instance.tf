provider "aws" {
  region = "${var.AWS_REGION}"
}

# terraform {
#   backend "s3" {
#     bucket = "avinashbuck"
#     key    = "Terraform_state_file/terraform.tfstate"
#     region = "ap-south-1" # Bucket location
#     #The name of a DynamoDB table to use for state locking and consistency.
#     #The table must have a primary key named LockID. If not present, locking will be disabled.
#     dynamodb_table = "terraform_state_lock" # First create a db table in the same region of bucket
#   }
# }
#   key_name = "mykey"
#   public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
# }

resource "aws_instance" "example" {
  count = 1
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.nano"
  key_name      = "Ohio"
  #key_name = "${aws_key_pair.mykeypair.key_name}"
  #key_name = "${aws_key_pair.mykey.key_name}"
  #subnet_id   = "subnet-028d7c6b"
  tags = {
    Name = "check-1"
  }

  #security_groups = ["${aws_security_group.allow-tcp.id}"]
  security_groups = ["ELK-SG"]

}

output "private_ip" {

  value = "${aws_instance.example.*.private_ip}"
  #value = "${aws_instance.example.private_ip}"
}

output "public_ip" {
  value = "${aws_instance.example.*.public_ip}"
  #value = "${aws_instance.example.public_ip}"
}
