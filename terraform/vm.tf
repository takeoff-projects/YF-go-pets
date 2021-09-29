resource "google_compute_instance" "vm" {
  count        = 1
  name         = "${var.project_id}-server-${count.index}"
  machine_type = var.machine_type
  zone         = var.zone

  tags = ["pets-webserver"]

  metadata_startup_script = file("start_pets.sh")

  scheduling {
    automatic_restart = !var.preemptible
    preemptible       = var.preemptible
  }

  boot_disk {
    initialize_params {
      image = var.image_id
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}
