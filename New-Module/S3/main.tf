provider "aws" {
 region = "us-east-2"
}
resource "aws_s3_bucket" "mybucket" {
 bucket = var.bucketname
 lifecycle {
 prevent_destroy = false
}
tags = {
     Name        = var.developer_name
     Team = var.team_name
   }

versioning {
    enabled = var.versioning1
   }
}
