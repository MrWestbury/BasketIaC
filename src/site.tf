# Main file containing terraform settings

terraform {
    # Setting local backend for testing.
    backend "local" {
    }
    
    # Live code would use azure storage account. eg:
    # backend "azurerm" {
    #     resource_group_name  = "rgterraform"
    #     storage_account_name = "terraformstate"
    #     container_name       = "tfstate"
    #     key                  = "terraform.tfstate"
    # }
}

module "Basket" {
    source = "./Modules/Basket"

    nameprefix = lookup(local.nameprefix, terraform.workspace)
    location   = lookup(local.location, terraform.workspace)
    https_only = lookup(local.https_only, terraform.workspace)

    tags = lookup(local.tags, terraform.workspace)

    subnet_ip_cidr = lookup(local.subnet_cidr, terraform.workspace)

    app_service_os = lookup(local.app_service_os, terraform.workspace)

    app_definitions = lookup(local.apps, terraform.workspace)

    storage_tier             = lookup(local.storage_tier, terraform.workspace)
    storage_replication_type = lookup(local.storage_redundancy, terraform.workspace)
}