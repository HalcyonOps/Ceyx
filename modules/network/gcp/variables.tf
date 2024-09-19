
variable "name" {
  description = "The name of the network."
  type        = string
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the subnet."
  type        = string
}

variable "region" {
  description = "The region where the network and subnet will be created."
  type        = string
}

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}
