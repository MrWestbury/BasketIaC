# Definition for vnet and subnets for the module 

resource "azurerm_virtual_network" "basket_vnet" {
    name                = "${lower(var.nameprefix)}-basket-vnet"
    location            = var.location
    resource_group_name = azurerm_resource_group.basket_rg.name
    address_space       = [var.vnet_ip_address_space]
}

resource "azurerm_subnet" "basket_app_subnet" {
    name                = "${var.nameprefix}BasketAppSubnet"
    resource_group_name = azurerm_resource_group.basket_rg.name
    virtual_network_name = azurerm_virtual_network.basket_vnet.name
    address_prefixes    = [var.subnet_ip_cidr]

    delegation {
    name = "basketappdelegation"

    service_delegation {
            name    = "Microsoft.Web/serverFarms"
            actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
        }
    }
}