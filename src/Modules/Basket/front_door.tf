resource "azurerm_frontdoor" "basket_frontdoor" {
    name                = "${var.nameprefix}basketfrontdoor"
    # location            = var.location
    resource_group_name = azurerm_resource_group.basket_rg.name

    tags = merge(var.tags, local.tags)

    # Reuse load balancing for both app routes
    backend_pool_load_balancing {
        name = "basketdefaultbeloadbalancing"
    }

    backend_pool_health_probe {
        name         = "basketdefaultbeprobesetting"
        protocol     = "Https"
        probe_method = "HEAD" # As we have no defined backend, just check for any response
    }

    enforce_backend_pools_certificate_name_check = true

    # This could be simplified to static blocks if it is known to only contain 2 apps
    # I have added dynamic blocks to demonstrate they are possible solution
    dynamic "backend_pool" {
        for_each = var.app_definitions

        content {
            name = "${var.nameprefix}basketbe-${backend_pool.key}"
            
            backend {
                host_header = azurerm_app_service.app_basket_app[backend_pool.key].default_site_hostname
                address     = azurerm_app_service.app_basket_app[backend_pool.key].default_site_hostname
                http_port   = 80
                https_port  = 443
            }

            load_balancing_name = "basketdefaultbeloadbalancing"
            health_probe_name   = "basketdefaultbeprobesetting"
        }
    }

    dynamic "routing_rule" {
        for_each = var.app_definitions

        content {
            name               = "route-${routing_rule.key}"
            accepted_protocols = routing_rule.value["https_only"] ? ["Https"] : ["Http", "Https"]
            patterns_to_match  = ["${routing_rule.value["path"]}"]
            frontend_endpoints = ["${var.nameprefix}basket-fe"]
            
            forwarding_configuration {
                forwarding_protocol = var.https_only ? "HttpsOnly" :  routing_rule.value["https_only"] ? "HttpsOnly" : "MatchRequest"
                backend_pool_name   = "${var.nameprefix}basketbe-${routing_rule.key}"
            }
        }
    }

    frontend_endpoint {
        name                                    = "${var.nameprefix}basket-fe"
        host_name                               = "${var.nameprefix}basketfrontdoor.azurefd.net"
        custom_https_provisioning_enabled       = false
        web_application_firewall_policy_link_id = azurerm_frontdoor_firewall_policy.basket_waf.id
    }
}