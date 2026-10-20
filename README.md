# Azure Storage Account — Terraform

[![Azure](https://img.shields.io/badge/Azure-Cloud%20Infrastructure-0078D4?logo=microsoftazure&logoColor=white)](https://www.google.com/search?q=Microsoft+Azure+Cloud+Infrastructure)  [![Terraform](https://img.shields.io/badge/Terraform-Infrastructure%20as%20Code-7B42BC?logo=terraform&logoColor=white)](https://www.google.com/search?q=Terraform+Infrastructure+as+Code)  [![GitHub](https://img.shields.io/badge/Version%20Control-GitHub-181717?logo=github&logoColor=white)](https://www.google.com/search?q=GitHub+Version+Control)

## 📌 Project Overview

This repository contains reusable Terraform configuration for creating **Azure Storage Accounts** using Infrastructure as Code (IaC).

The configuration uses Terraform's `for_each` to manage storage account resources dynamically instead of hardcoding individual resources.

This repository is part of a modular Azure infrastructure project for a Loan Management System.

## 🏗️ Architecture

The parent infrastructure project uses separate Terraform repositories to manage Azure resources:

- Resource Group
- Storage Account
- Storage Container
- Blob Storage

Each repository manages its own resource type, helping improve reusability, maintainability, and organization.

## ☁️ Azure Resources

| Property | Configuration |
|---|---|
| Cloud Provider | Microsoft Azure |
| Resource | Azure Storage Account |
| Infrastructure as Code | Terraform |
| Region | Southeast Asia |
| Performance Tier | Standard |
| Replication | GRS |
| Resource Group | `rg-lms-idn-dev-01` |
| Storage Account | `stlmsidndev001` |

*These values describe the project configuration; verify them against your current Terraform files and deployed Azure resources.*

## 📂 Repository Structure

```text
terraform-azure-storage-account/
├── main.tf
├── variables.tf
├── terraform.tfvars
├── provider.tf
├── outputs.tf
├── .gitignore
└── README.md
```

*The file structure above is a suggested layout. Adjust it to match the files actually present in your repository.*

## ⚙️ How It Works

### 1. Provider Configuration

The AzureRM provider allows Terraform to manage Azure resources.

### 2. Variables

Variables make the configuration reusable and allow resource properties to be supplied separately.

### 3. `for_each`

Terraform's `for_each` creates one or more storage accounts from a map of configuration values.

Example:

```hcl
resource "azurerm_storage_account" "storage_account" {
  for_each = var.sa

  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}
```

This example assumes `var.sa` is defined as a map of storage account configurations and the referenced resource group already exists.

## 🚀 Deployment Steps

### Prerequisites

- An Azure subscription
- Terraform installed
- Azure CLI installed
- Appropriate Azure permissions
- An existing resource group matching the configuration

### Step 1: Login to Azure

```powershell
az login
```

### Step 2: Initialize Terraform

```powershell
terraform init
```

### Step 3: Validate Configuration

```powershell
terraform validate
```

### Step 4: Review the Execution Plan

```powershell
terraform plan
```

### Step 5: Apply Configuration

```powershell
terraform apply
```

Review the proposed changes and confirm when prompted.

## 🔍 Verify the Deployment

Verify the Storage Account in the Azure Portal:

1. Open the Azure Portal.
2. Search for **Storage accounts**.
3. Open the target resource group.
4. Confirm that the expected Storage Account exists.
5. Check the region, performance tier, and replication setting.

## 🔐 Best Practices

- Use variables instead of hardcoding resource configuration.
- Use `for_each` when managing multiple resources from a map.
- Keep credentials and secrets out of GitHub.
- Use a remote backend for shared Terraform state when configured.
- Apply least-privilege access through Azure RBAC.
- Review `terraform plan` before applying changes.
- Use separate configurations or variable files for different environments.

## 🎯 Key Learnings

- Managing Azure Storage Accounts using Terraform.
- Using variables and `for_each` for reusable configuration.
- Automating infrastructure deployment with Infrastructure as Code.
- Organizing Terraform code into separate repositories.
- Verifying deployed resources through the Azure Portal.
n`
