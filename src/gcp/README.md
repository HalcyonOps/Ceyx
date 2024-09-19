# GCP Terraform Configuration

This directory contains Terraform configurations for deploying resources on Google Cloud Platform (GCP) using the Ceyx modules. It provides an example of how to deploy compute, network, and storage resources on GCP.

## Directory Structure

- **`main.tf`**: The main Terraform configuration file that references the GCP-specific modules.
- **`variables.tf`**: Variable definitions used in the GCP deployment.
- **`outputs.tf`**: Output values for the GCP deployment, such as instance and bucket names.
- **`terraform.tfvars.template`**: Template for setting variable values specific to your deployment.

## Prerequisites

1. **Terraform**: Install [Terraform](https://www.terraform.io/downloads.html).
2. **GCP CLI**: Install and configure the [Google Cloud SDK](https://cloud.google.com/sdk) with appropriate credentials.
3. **GCP Project**: An active GCP project with necessary permissions to create resources.

## Usage

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/HalcyonWorks/Ceyx.git
   cd Ceyx/src/gcp
   ```

2. **Create a `terraform.tfvars` File**:

   Copy the `terraform.tfvars.template` to `terraform.tfvars` and update the values:

   ```bash
   cp terraform.tfvars.template terraform.tfvars
   ```

   Edit the `terraform.tfvars` file to provide your specific values, such as:

   ```hcl
   name             = "my-gcp-project"
   region           = "us-central1"
   project_id       = "my-gcp-project-id"
   credentials_file = "~/.gcp/credentials.json"
   tags = {
     Environment = "Development"
   }
   ```

3. **Authenticate with GCP**:

   Authenticate your CLI with the provided credentials:

   ```bash
   gcloud auth activate-service-account --key-file ~/.gcp/credentials.json
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

- **Compute**: Provisions GCE instances.
- **Network**: Sets up VPC networks and subnets.
- **Storage**: Creates a GCS bucket.

## Notes

- Ensure you have the necessary permissions in your GCP project to create and manage resources.
- Adjust the `variables.tf` and `main.tf` files as needed to customize your deployment.

## Troubleshooting

- If you encounter any issues, verify your GCP CLI configuration and permissions.
- Use the `terraform plan` command to check for any errors before applying changes.

For additional help or customizations, refer to the [Ceyx Documentation](https://github.com/HalcyonWorks/Ceyx).
