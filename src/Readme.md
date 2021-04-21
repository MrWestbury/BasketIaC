# Terraform Source

This folder contains the terraform code in response to the Basket IaCTest. It is authored by Adam Eastbury

For this implementation I chose to embed the module code within the code base. However, in production circumstances I would host this in a separate git repository and reference the source as a git url with a tag ref. This allows a separation of concern between module and environment and tagging allows for version control.

## Folder structure
```
.
+-- Modules
|   +-- Basket
|   |   +-- app_service_plan.tf
|   |   +-- app_services.tf
|   |   +-- firewall.tf
|   |   +-- front_door.tf
|   |   +-- local.tf
|   |   +-- main.tf
|   |   +-- Readme.md
|   |   +-- resource_group.tf
|   |   +-- storage_account.tf
|   |   +-- variables.tf
|   |   +-- vnet.tf
+-- Readme.tf
+-- environments.tf
+-- site.tf
```

## Adding environments

To support multiple environments from a single codebase, I have implemented a possible solution of using terraform workspaces to reference values in a locals definition in `environments.tf`