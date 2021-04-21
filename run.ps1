param([switch] $destroy)

./vars.ps1


$origFolder = Get-Location
Set-Location ./src/
terraform init
terraform validate

if($destroy) {
    terraform destroy
}
else {
    terraform plan -out basket.tfplan
    $confirmation = Read-Host "Do you want to apply these changes (y/N)?"
    if ($confirmation -eq 'y') {
        terraform apply basket.tfplan
    }
}

Set-Location $origFolder