terraform {
  backend "azurerm" {
    resource_group_name  = "CICD-Pipeline"
    storage_account_name = "terraformcicdpipeline"
    container_name       = "tfcode"
    key                  = "dev.terraform.tfstate"
  }
}
module "RG" {
  source   = "./modules/RG" #A
  rgname   = var.rgname     #B
  location = var.location
}
module "SA" {
  source   = "./modules/StorageAccount"
  sname    = var.sname
  rgname   = var.rgname
  location = var.location
}