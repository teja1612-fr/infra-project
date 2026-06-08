# Infrastructure Automation Project

## What This Does

Automates infrastructure provisioning and machine image creation using Terraform, Packer, and Jenkins. The project demonstrates Infrastructure as Code (IaC) and CI/CD practices for cloud resource deployment.

## Tech Stack

Jenkins • Terraform • Packer • AWS • GitHub • Linux

## How It Works

1. Code changes are pushed to GitHub.
2. Jenkins triggers the automation pipeline.
3. Terraform provisions the required AWS infrastructure.
4. Packer creates a custom machine image with pre-installed software.
5. Infrastructure and images are managed through version-controlled code.

## Files

* `Jenkinsfile` – Pipeline automation configuration.
* `terraform/` – Infrastructure provisioning code.
* `packer/` – Custom machine image templates and configurations.

## Key Concepts Demonstrated

* Infrastructure as Code (IaC)
* Automated Infrastructure Provisioning
* Custom AMI Creation with Packer
* CI/CD Pipeline Automation
* Cloud Resource Management on AWS
* Version-Controlled Infrastructure
