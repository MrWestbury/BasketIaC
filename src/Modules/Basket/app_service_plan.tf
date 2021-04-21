resource "azurerm_app_service_plan" "basket_app_plan" {
    name = "${var.nameprefix}basketappservice"
    location = var.location
    resource_group_name = azurerm_resource_group.basket_rg.name
    kind = var.app_service_os

    reserved = var.app_service_os == "Linux" ? true : false

    tags = merge(var.tags, local.tags)

    sku {
        tier = "Free"
        size = "F1"
    }
}