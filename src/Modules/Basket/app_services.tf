# Definition of app services used in the module

resource "azurerm_app_service" "app_basket_app" {
    for_each = var.app_definitions

    name                = "${var.nameprefix}basket-${each.key}"
    location            = var.location
    resource_group_name = azurerm_resource_group.basket_rg.name
    app_service_plan_id = azurerm_app_service_plan.basket_app_plan.id
    https_only          = var.https_only ? var.https_only : each.value.https_only 

    tags = merge(var.tags, local.tags)
    
    site_config {
        always_on                 = false
        dotnet_framework_version  = var.app_service_os == "Windows" ? "v5.0" : null # Adding for windows deployments
        use_32_bit_worker_process = true
        
        ip_restriction {
            # Add security to prevent bypassing frontdoor firewall
            service_tag = "AzureFrontDoor.Backend"
            action      = "Allow"
        }
    }
}

resource "azurerm_app_service_virtual_network_swift_connection" "app_basket_app_vnet_integration" {
    for_each = var.app_definitions

    app_service_id = azurerm_app_service.app_basket_app[each.key].id
    subnet_id      = azurerm_subnet.basket_app_subnet.id
}