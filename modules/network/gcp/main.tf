
resource "google_compute_network" "this" {
  name                    = var.name
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}

resource "google_compute_subnetwork" "this" {
  name          = "${var.name}-subnet"
  network       = google_compute_network.this.id
  ip_cidr_range = var.subnet_cidr_block
  region        = var.region
}
