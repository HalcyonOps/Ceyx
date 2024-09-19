
variable "name" {
  description = "The name of the Azure Virtual Machine."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group to deploy the VM into."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy the VM."
  type        = string
}

variable "vm_size" {
  description = "The size of the Azure Virtual Machine."
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "The admin username for the VM."
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "The admin password for the VM."
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
