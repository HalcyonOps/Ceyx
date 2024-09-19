provider "azurerm" {
  features {}
}

module "azure_compute" {
  source              = "../../modules/compute/azure"
  name                = var.name
  resource_group_name = var.resource_group_name
  region              = var.region
  tags                = var.tags
}

module "azure_network" {
  source              = "../../modules/network/azure"
  name                = var.name
  resource_group_name = var.resource_group_name
  region              = var.region
  tags                = var.tags
}

module "azure_storage" {
  source              = "../../modules/storage/azure"
  name                = var.name
  resource_group_name = var.resource_group_name
  region              = var.region
  tags                = var.tags
}
