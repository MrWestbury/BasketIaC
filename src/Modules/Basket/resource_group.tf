# Definition for resource group for the module

resource "azurerm_resource_group" "basket_rg" {
  name     = "${var.nameprefix}basket"
  location = var.location

  tags = merge(var.tags, local.tags)
}