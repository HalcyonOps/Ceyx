# Azure Terraform Configuration

This directory contains Terraform configurations for deploying resources on Azure using the Ceyx modules. It provides an example of how to deploy compute, network, and storage resources on Azure.

## Directory Structure

- **`main.tf`**: The main Terraform configuration file that references the Azure-specific modules.
- **`variables.tf`**: Variable definitions used in the Azure deployment.
- **`outputs.tf`**: Output values for the Azure deployment, such as virtual network and VM IDs.
- **`terraform.tfvars.template`**: Template for setting variable values specific to your deployment.

## Prerequisites

1. **Terraform**: Install [Terraform](https://www.terraform.io/downloads.html).
2. **Azure CLI**: Install and configure the [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli).
3. **Azure Account**: An active Azure account with necessary permissions to create resources.

## Usage

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/HalcyonWorks/Ceyx.git
   cd Ceyx/src/azure
   ```

2. **Create a `terraform.tfvars` File**:

   Copy the `terraform.tfvars.template` to `terraform.tfvars` and update the values:

   ```bash
   cp terraform.tfvars.template terraform.tfvars
   ```

   Edit the `terraform.tfvars` file to provide your specific values, such as:

   ```hcl
   name               = "my-azure-project"
   region             = "East US"
   resource_group_name = "my-azure-resource-group"
   tags = {
     Environment = "Development"
   }
   ```

3. **Login to Azure**:

   Login to your Azure account using the Azure CLI:

   ```bash
   az login
   ```

4. **Initialize Terraform**:

   Initialize the Terraform configuration:

   ```bash
   terraform init
   ```

5. **Plan the Deployment**:

   Review the planned actions:

   ```bash
   terraform plan
   ```

6. **Apply the Configuration**:

   Deploy the infrastructure:

   ```bash
   terraform apply
   ```

7. **Verify Deployment**:

   Check the outputs for resource IDs and other information:

   ```bash
   terraform output
   ```

8. **Clean Up Resources**:

   To destroy the deployed resources, run:

   ```bash
   terraform destroy
   ```

## Modules Used

- **Compute**: Provisions Azure VMs.
- **Network**: Sets up a virtual network and subnets.
- **Storage**: Creates a storage account and container.

## Notes

- Ensure you have the necessary permissions in your Azure account to create and manage resources.
- Adjust the `variables.tf` and `main.tf` files as needed to customize your deployment.

## Troubleshooting

- If you encounter any issues, verify your Azure CLI configuration and permissions.
- Use the `terraform plan` command to check for any errors before applying changes.

For additional help or customizations, refer to the [Ceyx Documentation](https://github.com/HalcyonWorks/Ceyx).
