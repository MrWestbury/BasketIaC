# Easy method of defining environment variables terraform uses to connect to azure
# Secrets would never normally be written to file like this. It is only for convenience for this exercise

$env:ARM_CLIENT_ID="<SP Client ID Here>"
$env:ARM_CLIENT_SECRET='<SP Client Secret Here>'
$env:ARM_SUBSCRIPTION_ID="<Azure Subscription ID Here>"
$env:ARM_TENANT_ID="<Azure Tenant ID Here>"