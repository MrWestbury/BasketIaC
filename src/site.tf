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
