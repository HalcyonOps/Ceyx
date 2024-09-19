resource "google_compute_instance" "this" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.self_link
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
    access_config {
      # Ephemeral public IP
    }
  }

  tags = [for key, value in var.tags : "${key}=${value}"]
}

data "google_compute_image" "my_image" {
  family  = var.image_family
  project = var.image_project
}
