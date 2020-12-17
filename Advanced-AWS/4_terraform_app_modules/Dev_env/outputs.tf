
output "my_network"{

    value = "${module.my_vpc.vpc_id}"


}


output "my_ip"{

    value = "${module.my_ec2.my_ip}"


}
