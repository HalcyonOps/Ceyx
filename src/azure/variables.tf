variable "name" {
  description = "The name of the project."
  type        = string
}

variable "region" {
  description = "The region where resources will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Azure resource group."
  type        = string
}

variable "tags" {
  description = "Common tags to be applied to all resources."
  type        = map(string)
  default     = {}
}
