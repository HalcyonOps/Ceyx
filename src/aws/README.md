# AWS Terraform Configuration

This directory contains Terraform configurations for deploying resources on AWS using the Ceyx modules. It provides an example of how to deploy compute, network, and storage resources on AWS.

## Directory Structure

- **`main.tf`**: The main Terraform configuration file that references the AWS-specific modules.
- **`variables.tf`**: Variable definitions used in the AWS deployment.
- **`outputs.tf`**: Output values for the AWS deployment, such as instance IDs and bucket names.
- **`terraform.tfvars.template`**: Template for setting variable values specific to your deployment.

## Prerequisites

1. **Terraform**: Install [Terraform](https://www.terraform.io/downloads.html).
2. **AWS CLI**: Install and configure the [AWS CLI](https://aws.amazon.com/cli/) with the appropriate credentials.
3. **AWS Account**: An active AWS account with necessary permissions to create resources.

## Usage

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/HalcyonWorks/Ceyx.git
   cd Ceyx/src/aws
   ```

2. **Create a `terraform.tfvars` File**:

   Copy the `terraform.tfvars.template` to `terraform.tfvars` and update the values:

   ```bash
   cp terraform.tfvars.template terraform.tfvars
   ```

   Edit the `terraform.tfvars` file to provide your specific values, such as:

   ```hcl
   name  = "my-aws-project"
   region = "us-east-1"
   tags = {
     Environment = "Development"
   }
   ```

3. **Initialize Terraform**:

   Initialize the Terraform configuration:

   ```bash
   terraform init
   ```

4. **Plan the Deployment**:

   Review the planned actions:

   ```bash
   terraform plan
   ```

5. **Apply the Configuration**:

   Deploy the infrastructure:

   ```bash
   terraform apply
   ```

6. **Verify Deployment**:

   Check the outputs for resource IDs and other information:

   ```bash
   terraform output
   ```

7. **Clean Up Resources**:

   To destroy the deployed resources, run:

   ```bash
   terraform destroy
   ```

## Modules Used

- **Compute**: Provisions EC2 instances.
- **Network**: Sets up a VPC, subnets, and security groups.
- **Storage**: Creates an S3 bucket.

## Notes

- Ensure you have the necessary permissions in your AWS account to create and manage resources.
- Adjust the `variables.tf` and `main.tf` files as needed to customize your deployment.

## Troubleshooting

- If you encounter any issues, verify your AWS CLI configuration and permissions.
- Use the `terraform plan` command to check for any errors before applying changes.

For additional help or customizations, refer to the [Ceyx Documentation](https://github.com/HalcyonWorks/Ceyx).
