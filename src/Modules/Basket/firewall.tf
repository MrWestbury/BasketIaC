# Definition of front door WAF policy

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