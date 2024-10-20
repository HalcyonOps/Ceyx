# Root Terraform Project README

## Overview
This repository is a collection of Terraform modules for managing cloud infrastructure across AWS, Azure, and GCP. It allows you to deploy and manage cloud resources such as VPCs, subnets, security groups, EC2 instances, EKS clusters, EBS volumes, and S3 buckets. The modules are designed to be reusable and adaptable to various use cases.

The root directory provides high-level orchestration for AWS, Azure, and GCP, utilizing the modules defined under the `modules` folder. You can find specialized modules for each cloud provider under `modules/compute`, `modules/network`, and `modules/storage`.

## Project Structure
Here is an overview of the project structure:

```
.
├── LICENSE
├── README.md               # This file, providing an overview of the project
├── generate-docs.md        # Documentation for generating the module docs
├── generate-docs.sh        # Script for generating module documentation
├── modules                 # Reusable modules for AWS, Azure, and GCP
│   ├── compute             # Compute resources (EC2, EKS, Node Groups)
│   ├── network             # Network resources (VPC, subnets, security groups)
│   └── storage             # Storage resources (S3, EBS)
└── src                     # Root-level infrastructure definitions for AWS, Azure, and GCP
    ├── aws                 # AWS-specific infrastructure definitions
    ├── azure               # Azure-specific infrastructure definitions
    └── gcp                 # GCP-specific infrastructure definitions
```

## Getting Started
To get started, you need to have the following prerequisites:

### Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) v1.0+
- [AWS CLI](https://aws.amazon.com/cli/), [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli), [GCP SDK](https://cloud.google.com/sdk/docs/install) for cloud provider authentication

Ensure that you have configured your cloud provider CLI for authentication. For AWS, for example, you would configure an AWS profile:

```sh
aws configure --profile your_profile_name
```

### Directory Breakdown
- **`modules/compute`**: Contains compute-related modules for EC2, EKS, and Node Groups. These are separated by cloud providers (AWS, Azure, GCP).
- **`modules/network`**: Contains networking modules like VPC, subnets, and security groups, categorized by each cloud provider.
- **`modules/storage`**: Contains storage modules for S3, EBS, and similar resources across all cloud providers.
- **`src/aws`**: AWS-specific infrastructure definitions. This is the entry point where the AWS modules are instantiated for your specific infrastructure.

## Usage
### Configuring Variables
You will need to define the appropriate values for the `.tfvars` file located in the `src/<provider>` directory.

To create your own variable file, you can copy the template and adjust the values:

```sh
cp src/aws/terraform.tfvars.template src/aws/terraform.tfvars
```

Edit `terraform.tfvars` with your desired configuration.

**Example:**

```hcl
aws_profile = "my_aws_profile"
aws_region  = "us-west-2"
vpcs = [
  {
    cidr_block              = "10.0.0.0/16"
    enable_dns_support      = true
    enable_dns_hostnames    = true
    assign_ipv6_cidr_block  = false
    create_internet_gateway = true
    igw_tags                = { Name = "example-igw" }
    vpc_tags                = { Name = "example-vpc" }
  }
]
```

### Running Terraform
1. Change to the relevant provider directory:

   ```sh
   cd src/aws
   ```

2. Initialize the project by running:

   ```sh
   terraform init
   ```

3. Preview the changes that Terraform will make to your infrastructure:

   ```sh
   terraform plan
   ```

4. Apply the changes to deploy the infrastructure:

   ```sh
   terraform apply
   ```

### Cleaning Up Resources
To destroy the resources created by Terraform, use:

```sh
terraform destroy
```

## Modules
The modules are reusable Terraform code that can be used to build cloud infrastructure across multiple environments and providers. They are designed to be composable, configurable, and easy to integrate with different cloud provider setups.

### Key Modules
- **`compute/aws/ec2`**: EC2 instance configuration for AWS, including optional settings like public IP association, monitoring, and termination protection.
- **`network/aws/vpc`**: VPC setup, including support for Internet Gateways, NAT, and VPN configurations.
- **`storage/aws/s3`**: S3 bucket module to configure buckets, policies, versioning, and CORS rules.

## Optional Configurations
You may choose to skip certain resources like VPC, EKS, or EC2 instances by simply not including them in your variable configuration (`terraform.tfvars`). The main configuration and module logic are designed to accommodate empty or missing resource lists without causing errors.

### Example: Omitting S3 Bucket Creation
To skip creating S3 buckets, you can set `s3_buckets` to an empty list in your variable file:

```hcl
s3_buckets = []
```

This will effectively prevent Terraform from instantiating the S3 modules.

## Generating Documentation
Use the `generate-docs.sh` script to generate updated documentation for all modules:

```sh
./generate-docs.sh
```

## Contributing
Contributions are welcome! Please submit a pull request with detailed information about the changes.

## License
This project is licensed under the MIT License - see the LICENSE file for details.
