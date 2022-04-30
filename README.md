# Introduction

This repository contains the Terraform file required to deploy the webservers running website.com to GCP

Modules have been created to deploy the following infrastructure;

 - VPC Network
 - Subnet 
 - 2 Windows Compute Instances 
 - 1 Instance Groups for the Virtual Machines
 - Firewall rules 

These modules have been created to allow you to deploy this infrastrucutre in addtional regions

To create addtional deployments in other regions you will need to create your own environment `variables.tfvars` & `backend.tf` files located in the `/tfproject/environment/<region>` folder. This will allow you to create an additional deployment depending on the variables provided

**Please note, this has been written using PowerShell as the terminal to run Terraform**

# Deployment

Use the initial `".\environment\europe-west\variables.tfvars"` as a template to create you own deployment placing this inside a folder for the region you wish to deploy
e.g: `".\environment\us-west\variables.tfvars"`

Create a storage bucket in GCP and update the `bucket` variable in the `backend.tf` file to store the Terraform state

Once created you can deploy this infrastructure as followed;

1. Authenticate with the Google CLI in you terminal
2. Navigate into the `tfproject` folder 

    `cd .\tfproject`

3. You can now initialize terraform in the project folder selecting your `.tfvars` file

    `terraform init -var-file=".\environment\europe-west\variables.tfvars" -backend-config=".\environment\europe-west\backend.tf"`

4. Ensure you have no errors. You can now run the apply

    `terraform apply -var-file=".\environment\europe-west\variables.tfvars"`

5. Terraform should now output a plan describing the deployment as listed in the introduction section
6. Type Yes to deploy the infrastructure ensuring you are happy with the plan output
7. Terraform will now deploy the infrastructure to GCP 

# Adding additional drive

To add an additional drive to the deployment there is a variable controlling the count of additional disks attached to the VM

Increment the variable `diskCount` in the `variables.tf` file to increase the number of attached disks