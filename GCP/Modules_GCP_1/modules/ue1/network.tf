resource "google_compute_subnetwork" "public_subnet" {
  name          =  "ue-public-net"
  ip_cidr_range = var.ue1_public_subnet
  network       = var.network_self_link
  region        = var.region_name
}
resource "google_compute_subnetwork" "private_subnet" {
  name          =  "ue-private-net"
  ip_cidr_range = var.ue1_private_subnet
  network      = var.network_self_link
  region        = var.region_name
}
