# resource "azurerm_web_application_firewall_policy" "basket_waf" {
#     name                = "${var.nameprefix}basketwafpolicy"
#     location            = var.location
#     resource_group_name = azurerm_resource_group.basket_rg.name

#     tags = merge(var.tags, local.tags)

#     policy_settings {
#         enabled                     = true
#         mode                        = "Prevention"
#         request_body_check          = true
#         file_upload_limit_in_mb     = 100
#         max_request_body_size_in_kb = 128
#     }

#     managed_rules {
#         managed_rule_set {
#         type = "OWASP"
#         version = "3.1"
#         }
#     }

# }

resource "azurerm_frontdoor_firewall_policy" "basket_waf" {
  name                              = "${var.nameprefix}basketwafpolicy"
  resource_group_name               = azurerm_resource_group.basket_rg.name
  enabled                           = true
  mode                              = "Prevention"
  
  managed_rule {
    type    = "DefaultRuleSet"
    version = "1.0"
  }

  managed_rule {
    type    = "Microsoft_BotManagerRuleSet"
    version = "1.0"
  }
}