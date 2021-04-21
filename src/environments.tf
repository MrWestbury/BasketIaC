locals {
    nameprefix = {
        default = "adam"
    }
    location = {
        default = "UK South"
    }

    https_only = {
        default = true
    }

    tags = {
        default = {
            Environment = "Testing"
        }
    }

    apps = {
        default = {
            app-a = {
                path = "/*"
                https_only = true
            }
            app-b = {
                path = "/AppB/*"
                https_only = true
            }
        }
    }

    subnet_cidr = {
        default = "10.0.2.0/24"
    }

    app_service_os = {
        default = "Windows"
    }

    storage_tier = {
        default = "Premium"
    }

    storage_redundancy = {
        default = "LRS"
    }
    
}