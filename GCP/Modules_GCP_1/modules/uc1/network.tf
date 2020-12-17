resource "google_compute_subnetwork" "public_subnet" {
  name          =  "uc-public-net"
  ip_cidr_range = var.uc1_public_subnet
  network       = var.network_self_link
  region        = var.region_name
}
resource "google_compute_subnetwork" "private_subnet" {
  name          =  "uc-private-net"
  ip_cidr_range = var.uc1_private_subnet
  network      = var.network_self_link
  region        = var.region_name
}
