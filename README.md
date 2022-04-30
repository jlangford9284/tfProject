# tfProject

# Introduction

This repository contains the Terraform file required to deploy the webservers running website.com to GCP

Modules have been created to deploy the following infrastructure;

 - VPC 
 - Subnet 
 - 2 Windows Compute Instances 
 - 1 Instance Groups for the Virtual Machines
 - Firewall rules 

These modules have been created to allow you to deploy this infrastrucutre in addtional regions

To create addtional deployments in other regions you will need to create your own environment `variables.tfvars` file located in the `/tfproject/environment` folder
This will allow you to create an additional deployment depending on the variables provided

**Please note, this guide has been written using PowerShell as the terminal to run Terraform**

# Deployment



To deploy this infrastructure follow these steps;

1. Authenticate with the Google CLI in you terminal
2. Navigate into the `tfproject` folder 
`cd .\tfproject`
3. You can now initialize terraform in the project folder selecting your `.tfvars` file
`terraform init -var-file=".\environment\europe-west\variables.tfvars"`
4. Ensure you have no errors. You can now run the apply
`terraform init -var-file=".\environment\europe-west\variables.tfvars"`
5. Terraform should now output a plan describing the deployment as listed in the introduction section
6. Type Yes to deploy the infrastructure
7. Terraform will now deploy the infrastructure to GCP 