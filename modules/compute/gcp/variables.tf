variable "name" {
  description = "The name of the GCP instance."
  type        = string
}

variable "region" {
  description = "The GCP region to deploy resources."
  type        = string
}

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "zone" {
  description = "The GCP zone to deploy the instance."
  type        = string
}

variable "machine_type" {
  description = "The type of machine to create."
  type        = string
  default     = "f1-micro"
}

variable "image_family" {
  description = "The image family to use for the instance."
  type        = string
  default     = "debian-10"
}

variable "image_project" {
  description = "The project where the image is hosted."
  type        = string
  default     = "debian-cloud"
}

variable "network" {
  description = "The network to attach the instance to."
  type        = string
}

variable "subnetwork" {
  description = "The subnetwork to attach the instance to."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
