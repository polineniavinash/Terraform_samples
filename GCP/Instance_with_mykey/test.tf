provider "google" {
  credentials = "${file("C:\\Users\\Administrator\\Desktop\\Avinash\\GCP\\account.json")}"
  project     = "myfirst-256611"
  region      = "us-central1"
}
resource "google_compute_instance" "gce" {
  count = 1
  name = "instances-${count.index + 1}"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
#Use only small letters
  tags = ["http-server"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
}
