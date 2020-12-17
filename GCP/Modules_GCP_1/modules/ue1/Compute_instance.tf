resource "google_compute_instance" "default" {
  count = 2
  #name         = "test"
  name = "instance-${count.index + 1}"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

#Use only small letters
  tags = ["webserver", "devenv"]

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

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
