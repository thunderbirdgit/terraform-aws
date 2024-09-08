# Terraform Setup for AWS EKS Cluster creation and ECR repository creation

## Project Description
##### Overview
This project uses Terraform to automate the setup of a AWS EKS cluster and installation of ECR repository on AWS Cloud Ingrastructure. The Terraform scripts provided in this repository are designed to simplify the process of infrastructure provisioning for both development environments and can be used for other environments as well. This setup includes creating and configuring the EKS cluster, configuring the ECR repository, and ensuring secure access and management through IAM roles

#### Goals
- Provision a EKS Cluster: Automate the creation of a EKS cluster with appropriate settings for development environments.
Deploy
- ECR: Set up a ECR repository for nonprod environment
- Ensure Security: Manage authentication and authorization through IAM roles.
- Facilitate Automation: Use Terraform to handle infrastructure as code, allowing for reproducible and consistent setups across different environments.

## Setup Instructions

1. **Setup AWS account Account**

   <img width="743" alt="image" src="https://github.com/user-attachments/assets/53d01b4b-9b6c-4bc7-91ea-80626976fcbd">

2. **Create Environment specific Configuration Files**

   Create the environment specific terrform variable files to reflect your specific project details.

   <img width="499" alt="image" src="https://github.com/user-attachments/assets/ff892917-4db9-485b-b802-86b2b9a9d621">

3. **Repository Structure**

   This repository includes the following components:

   - **`main.tf`**
     - Configures the VPC, EKS and ECR modules from the main terraform file
     - Contains subfolders `ecr`, which include necessary modules and resources for deploying the EKS cluster and ECR repository

   - **`variables.tf`**
     - Defines global variables, which can be overridden in the specific module's `variables.tf` file.

     - **`ecr/`**
       - Sets up ECR repository in AWS.       
       - **`variables.tf`**
         - Allows overriding of global variables defined in `main-variables.tf`.
       
4. **Execute the terraform commands**
      ```
      terraform init
      terraform plan -var-file="terraform.dev.tfvars"
      terraform apply -var-file="terraform.dev.tfvars"
      ```

       You can also execute specific module to install ECR alone
       ```
       terraform init
       terraform plan -var-file="terraform.dev.tfvars" -target=module.ecr
       terraform apply -var-file="terraform.dev.tfvars" -target=module.ecr
       ```
      
5. **Verify the Setup**
After applying the Terraform configurations, verify EKS cluster and ECR repo is created:

EKS Cluster:
<img width="1286" alt="image" src="https://github.com/user-attachments/assets/fb56758e-f698-479a-b41f-027d4ebdf786">

ECR repo for microservice:
<img width="753" alt="image" src="https://github.com/user-attachments/assets/b02a2494-e47b-42f4-86eb-5d36f1ba3ea6">

6. **Cleanup Resources**
- When you have finished and want to destroy the clusters to save costs, run: `terraform destroy`

