provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project_id
  region      = var.region
}

module "gcp_compute" {
  source           = "../../modules/compute/gcp"
  name             = var.name
  region           = var.region
  credentials_file = var.credentials_file
  tags             = var.tags
}

module "gcp_network" {
  source           = "../../modules/network/gcp"
  name             = var.name
  region           = var.region
  project_id       = var.project_id
  credentials_file = var.credentials_file
  tags             = var.tags
}

module "gcp_storage" {
  source           = "../../modules/storage/gcp"
  name             = var.name
  region           = var.region
  project_id       = var.project_id
  credentials_file = var.credentials_file
  tags             = var.tags
}
