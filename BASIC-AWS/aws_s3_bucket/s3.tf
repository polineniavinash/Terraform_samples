resource "aws_s3_bucket" "mybucket" {
 bucket = "${var.bucketname}"
 versioning {
 enabled = true
 }
 lifecycle {
  #prevent_destroy = true
 prevent_destroy = false
 }
}
