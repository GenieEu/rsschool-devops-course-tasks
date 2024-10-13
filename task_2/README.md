# AWS Infrastructure Deployment with Terraform

This project automates the provisioning of AWS infrastructure using Terraform. The infrastructure consists of a Virtual Private Cloud (VPC), public and private subnets, Internet Gateway, NAT Gateway, and a Bastion Host. Additionally, a GitHub Actions workflow is included to automate the deployment process via Terragrunt.

## Features

- **VPC**: A Virtual Private Cloud (VPC) with a customizable CIDR block.
- **Subnets**: 
  - 2 public subnets in different availability zones (AZs).
  - 2 private subnets in different availability zones (AZs).
- **Networking Components**:
  - An Internet Gateway for public internet access.
  - A NAT Gateway to enable internet access for private subnets.
- **Bastion Host**: A Bastion Host instance to allow secure access to resources in the private subnets.
  
## Terraform Variables

| Variable              | Type           | Default Value                | Description                                     |
|-----------------------|----------------|------------------------------|-------------------------------------------------|
| `region`              | `string`       | `us-east-1`                  | AWS region for infrastructure deployment        |
| `vpc_cidr`            | `string`       | `13.0.0.0/16`                | CIDR block for the VPC                          |
| `private_subnets_cidr`| `list(string)` | `["13.0.0.0/24", "13.0.1.0/24"]` | CIDR blocks for private subnets                 |
| `public_subnets_cidr` | `list(string)` | `["13.0.2.0/24", "13.0.3.0/24"]` | CIDR blocks for public subnets                  |
| `ami`                 | `string`       | `ami-0fff1b9a61dec8a5f`       | AMI ID for Bastion Host instance                |
| `instance_type`       | `string`       | `t2.micro`                   | Instance type for the Bastion Host              |

## Prerequisites

- AWS Account with necessary permissions.
- AWS CLI configured locally.
- Terraform and Terragrunt installed.
- GitHub repository with access to AWS secrets stored in GitHub Actions.

### Secrets Configuration

Make sure to set the following GitHub Secrets in your repository settings:

- `AWS_ACCESS_KEY_ID`: Your AWS Access Key ID.
- `AWS_SECRET_ACCESS_KEY`: Your AWS Secret Access Key.
- `AWS_ACCOUNT_ID`: Your AWS Account ID.

## Usage

1. Clone the repository and navigate to the directory containing your Terraform code.

   ```bash
   git clone https://github.com/your-repo/aws-terraform-infra.git
   cd aws-terraform-infra/task_2
   ```

2. Initialize Terraform and Terragrunt.

   ```bash
   terragrunt init
   ```

3. Plan the infrastructure deployment.

   ```bash
   terraform plan
   ```

4. Apply the infrastructure configuration.

   ```bash
   terraform apply
   ```

The infrastructure will be provisioned in your AWS account.
