# Site configuration to deploy the basket module
# Parameters provided by the environments.tf file lookup based on workspace name

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