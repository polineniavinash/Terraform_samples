resource "google_compute_instance" "default" {
  count=1
  #name         = "${format("%s","${var.company}-${var.env}-${var.region_map["${var.region_name}"]}-instance1")}"
  name = "instance-${count.index + 1}"
  machine_type  = "n1-standard-1"
  #zone         =   "${element(var.var_zones, count.index)}"
  zone          =   "${format("%s","${var.region_name}-b")}"
  tags          = ["ssh","http"]
  boot_disk {
    initialize_params {
      image     =  "debian-cloud/debian-9"
    }
  }
labels {
      webserver =  "true"
    }
metadata_startup_script = "${file(script.sh)}"
network_interface {
    subnetwork = "${google_compute_subnetwork.public_subnet.name}"
    access_config {
      // Ephemeral IP
    }
  }
}
