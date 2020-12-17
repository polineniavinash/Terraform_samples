data "google_compute_image" "my_image" {
  family  = "debian-9"
  project = "debian-cloud"
}
resource "google_compute_network" "new-vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = var.auto_create_subnetworks
  description             = "This module creates a VPC - if auto_create_subnetworks is set to true, a subnet for each reagion will be created automatically"
}

resource "google_compute_subnetwork" "public-subnet" {
  name          =  "us-public-net"
  ip_cidr_range = var.public_subnet_range
  network       = "${google_compute_network.new-vpc.self_link}"
  region        = "us-central1"
}
resource "google_compute_subnetwork" "private-subnet" {
  name          =  "ae-private-net"
  ip_cidr_range = var.private_subnet_range
  network       = "${google_compute_network.new-vpc.self_link}"
  region        = "asia-east1"
  private_ip_google_access  = true
}

resource "google_compute_firewall" "firewall1" {
  name    = "test-firewall"
  network = google_compute_network.new-vpc.name
  source_ranges = ["0.0.0.0/0","10.1.0.0/20"]
  target_tags = ["webserver"]
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "22"]
  }

  source_tags = ["web"]
}
resource "google_compute_instance" "gce" {
  count = 2
  name         = "instance-${count.index + 1}"
  machine_type = var.instance_type
  zone         = var.instance_zone

  tags = ["webserver"]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.self_link
    }
  }

  // Local SSD disk
  scratch_disk {
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.public-subnet.self_link}"
    #network_ip = "10.1.100.0/32"
    access_config {
      // Ephemeral IP
    }
  }


  metadata = {
     foo = "bar"
   }

  #metadata_startup_script = "${file(C:\\Users\\Administrator\\Documents\\Terraform\\GCP\\VPC_Instance_GCP\\scripts.sh)}"
  metadata_startup_script = "${file("${var.script}")}"
  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
