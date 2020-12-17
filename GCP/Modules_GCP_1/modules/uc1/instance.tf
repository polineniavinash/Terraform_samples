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
metadata {
startup-script = <<SCRIPT
apt-get update -y
apt-get install apache2 -y
apt-get install php7.0 -y
mv /var/www/html/index.html /var/www/html/index.php
cat <<EOF > /var/www/html/index.php
<html>
<body> Hello world!! <br></br>
<?php
echo gethostname();
?>
</body>
</html>
EOF
SCRIPT
}
network_interface {
    subnetwork = "${google_compute_subnetwork.public_subnet.name}"
    access_config {
      // Ephemeral IP
    }
  }
}
