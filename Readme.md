# PureGym Basket IaC Test

This repo contains the terraform code in answer to the IaC test written by Adam Eastbury

## Deploy

I have created a run powershel script for deployment and destroying infrastructur

1. Update vars.ps1 with credentials for accessing azure
2. From powershell change the directory to the run the root of the repo
3. Run command `./run.ps1` to deploy. This will run init and plan commands before asking if you wish to apply the changes
4. If you do want to deploy, enter `y`

## Destroy

To destroy the infrastucture via terraform, the script supports a `-destroy` switch.

1. Update vars.ps1 with credentials for accessing azure
2. From powershell change the directory to the run the root of the repo
3. Run command `./run.ps1 -destroy` to run terraform destroy.
4. Once terraform has completed the plan, enter `yes` to confirm destruction of resources
