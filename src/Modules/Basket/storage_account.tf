# Definition of storage accounts for the module

resource "azurerm_storage_account" "basket_storage_account" {
    name                     = "${var.nameprefix}basketstorage"
    location                 = var.location
    resource_group_name      = azurerm_resource_group.basket_rg.name
    account_tier             = var.storage_tier
    account_replication_type = var.storage_replication_type

    tags = merge(var.tags, local.tags)
}