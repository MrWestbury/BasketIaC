# General variables

## Prefix for naming resources to help keep consistency and uniqueness
variable "nameprefix" {
    type        = string
    description = "Prefix string for resource naming"
    default     = ""
}

## Azure region variable to keep consistency accros resources
variable "location" {
    type        = string
    description = "Azure region to deploy basket module to"
}

variable "https_only" {
    type        = bool
    description = "Set all resources to only use HTTPS protocol. This will override https_only setting within app_definitions"
}

## Additional tags to deploy on top of resource tags
variable "tags" {
    type        = map
    description = "Additional tagging to add to all resources"
    default     = {}
}

# Networking

## VNET IP Address space
variable "vnet_ip_address_space" {
    type        = string
    description = "CIDR format describing the IP range available in the vnet"
    default     = "10.0.0.0/16"
    validation {
        condition     = can(cidrhost(var.vnet_ip_address_space, 0))
        error_message = "Subnet IP CIDR format is invalid."
    }
}

## Subnet CIDR size
variable "subnet_ip_cidr" {
    type        = string
    description = "CIDR bitmask to define the size of the subnet used for the basket apps. Defaults to 10.0.0.0/24"
    default     = "10.0.1.0/24"
    validation {
        condition     = can(cidrhost(var.subnet_ip_cidr, 0))
        error_message = "Subnet IP CIDR format is invalid or does not fall within VNET IP address space."
    }
}

# Application

## App Service Host OS
variable "app_service_os" {
    type = string
    description = "App service host OS to use for application services. Valid values are \"Linux\" and \"Windows\"/ Defaults to \"Linux\"."
    default     = "Linux"
    validation {
        condition = can(regex("^((Linux)|(Windows))$", var.app_service_os))
        error_message = "App Service OS must be either \"Linux\" or \"Windows\"."
    }
}

## Defintions of application to configure
variable "app_definitions" {
    type = map(object({
        path = string
        https_only = bool
    }))
    description = "Objects to describe the applications infrastucure to deploy. eg. app = { path = string, https_only = bool }."
}

# Storage

## Storage tier for the storage account
variable "storage_tier" {
    type = string
    description = "Storage account tier. Defaults to \"Standard\""
}

## Replication type for the storage account
### - LRS   = Locally redundant storage
### - GRS   = Geo-redundant storage
### - RAGRS = Read-access geo-redundant storage
### - ZRS   = Zone redundant storage
### - GZRS  = Geo-zone-redundant storage
### - RAGZRS = Read-access geo-zone-redundant storage 
variable "storage_replication_type" {
    type        = string
    description = "Replication type of the storage account. Possible values are \"LRS\", \"GRS\", \"RAGRS\", \"ZRS\", \"GZRS\", \"RAGZRS\". Defaults to \"LRS\"."
}
