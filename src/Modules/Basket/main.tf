# Defintion terraform and provider settings for the module

terraform {
  required_version = ">= 0.13.0" # Terraform 0.13.0 required for input variable validation

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0" # Pin provider version to avoid unforseen breaking changes in future provider versions
    }
  }
}

provider "azurerm" {
  features {}
}