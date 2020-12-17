output "name" {
  value       = "${google_compute_network.new-vpc.name}"
  description = "The unique name of the network"
}

output "instance_ipv4" {
  #value       = "${google_compute_instance.default.public_ip}"
  value       = "${google_compute_instance.gce.*.network_interface.0.access_config.0.nat_ip}"
  description = "The IPv4 address of the gateway"
}
