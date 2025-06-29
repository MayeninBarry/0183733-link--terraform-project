terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  required_version = ">= 1.0"
}
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "devt1res" {
  name     = "det01"
  location = "East US"
}

resource "azurerm_storage_account" "devt1sa" {
  name                     = "det01sa"
  resource_group_name      = azurerm_resource_group.devt1res.name
  location                 = azurerm_resource_group.devt1res.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}