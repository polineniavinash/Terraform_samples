resource "google_compute_instance" "gce" {
  count = 2
  #name         = "test"
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

  // Local SSD disk
  scratch_disk {
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo = "bar"
  }

  #metadata_startup_script = "echo hi > /test.txt"
  metadata_startup_script = "${file("${var.script}")}"
  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
