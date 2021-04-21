# Basket Terraform Module

## Introduction

This terraform module deploys the resources required for the basket test application.
Code written by Adam Eastbury


## Variables

### nameprefix

Prefix to add to all resources to help create unique names while maintaining naming consistency.

### location

Azure region to deploy resources to.

### https_only

Boolean to set all resources to only support https.

### tags

Map of additional tags to add to all resources.

### vnet_ip_address_space

CIDR string of the vnet address space.

### subnet_ip_cidr

CIDR string of the subnet for app vnet integration.

### app_definitions

Map of values to define apps to deploy. Format follows:
```
app-id = {
    path = "/*" # Path used for routing in front door service
    https_only = true # Set this app to be https only. Global https_only variable overrides this value.
}
```

### storage_tier

Tier of storage account to deploy. Values can be either `Standard` or `Premium`

### storage_replication_type

Type of data replication to sue with storage account. Possible values:

- `LRS`   = Locally redundant storage
- `GRS`   = Geo-redundant storage
- `RAGRS` = Read-access geo-redundant storage
- `ZRS`   = Zone redundant storage
- `GZRS`  = Geo-zone-redundant storage
- `RAGZRS` = Read-access geo-zone-redundant storage 
