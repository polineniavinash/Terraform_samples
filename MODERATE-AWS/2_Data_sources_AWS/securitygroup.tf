data "aws_ip_ranges" "european_ec2" {
  #Filter IP ranges by regions (or include all regions, if omitted).
  #Valid items are global (for cloudfront) as well as all AWS regions (e.g. eu-west-1 ,eu-central-1)
  regions = [ "eu-west-1", "eu-central-1" ]
  #Filter IP ranges by services. Valid items are amazon (for amazon.com),
  #cloudfront, codebuild, ec2, route53, route53_healthchecks and S3.
  services = [ "ec2" ]
}

resource "aws_security_group" "from_europe" {
 name = "from_europe"

  ingress {
    from_port = "443"
    to_port = "443"
    protocol = "tcp"
    cidr_blocks = [ "${data.aws_ip_ranges.european_ec2.cidr_blocks}" ]
  }
  tags {
    #The publication time of the IP ranges (e.g. 2016-08-03-23-46-05).
    CreateDate = "${data.aws_ip_ranges.european_ec2.create_date}"
    #The publication time of the IP ranges, in Unix epoch time format (e.g. 1470267965).
    SyncToken = "${data.aws_ip_ranges.european_ec2.sync_token}"
  }

}
