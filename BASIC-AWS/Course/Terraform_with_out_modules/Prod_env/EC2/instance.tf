resource "aws_instance" "myinstance" {
  count = var.ec2_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id        = var.subnet_id

  tags = {
   Name = "myinstance-${count.index+1}"
 }
}
