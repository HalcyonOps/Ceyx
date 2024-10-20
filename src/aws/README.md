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

## Configuration

### AWS Provider Variables

- `aws_region`: The AWS region to deploy resources in. Example: `"us-east-1"`
- `aws_profile`: The AWS CLI profile to use. Example: `"961347593789_AdministratorAccess"`

### VPC Variables

- `vpc_cidr_block`: The CIDR block for the VPC. Example: `"10.0.0.0/16"`
- `vpc_tags`: Tags to apply to the VPC. Example:
  ```hcl
  vpc_tags = {
    Name = "example-vpc"
  }
  ```

### Subnet Variables

- `subnet_cidr_block`: The CIDR block for the subnet. Example: `"10.0.1.0/24"`
- `availability_zone`: The availability zone for the subnet. Example: `"us-east-1a"`
- `subnet_tags`: Tags to apply to the subnet. Example:
  ```hcl
  subnet_tags = {
    Name = "example-subnet"
  }
  ```

### Security Group Variables

- `security_group_name`: The name of the security group. Example: `"example-sg"`
- `security_group_description`: The description of the security group. Example: `"Example security group"`
- `ingress_from_port`: The starting port for ingress rules. Example: `80`
- `ingress_to_port`: The ending port for ingress rules. Example: `80`
- `ingress_protocol`: The protocol for ingress rules. Example: `"tcp"`
- `ingress_cidr_blocks`: The CIDR blocks for ingress rules. Example: `["0.0.0.0/0"]`
- `egress_from_port`: The starting port for egress rules. Example: `0`
- `egress_to_port`: The ending port for egress rules. Example: `0`
- `egress_protocol`: The protocol for egress rules. Example: `"-1"`
- `egress_cidr_blocks`: The CIDR blocks for egress rules. Example: `["0.0.0.0/0"]`
- `security_group_tags`: Tags to apply to the security group. Example:
  ```hcl
  security_group_tags = {
    Name = "example-sg"
  }
  ```

### EC2 Instance Variables

- `ami_id`: The AMI ID for the EC2 instance. Example: `"ami-052b9fbb6949f883a"`
- `instance_type`: The instance type for the EC2 instance. Example: `"t2.micro"`
- `compute_tags`: Tags to apply to the EC2 instance. Example:
  ```hcl
  compute_tags = {
    Name = "example-instance"
  }
  ```
- `monitoring`: Enable detailed monitoring. Example: `false`
- `disable_api_termination`: Prevent instance termination via API. Example: `false`

### EBS Volume Variables

- `ebs_size`: The size of the EBS volume in GB. Example: `20`
- `ebs_tags`: Tags to apply to the EBS volume. Example:
  ```hcl
  ebs_tags = {
    Name = "example-ebs"
  }
  ```
- `ebs_volume_type`: The type of the EBS volume. Example: `"gp2"`
- `ebs_encrypted`: Whether the EBS volume is encrypted. Example: `false`
- `ebs_iops`: The IOPS for the EBS volume (if applicable). Example: `100`
- `ebs_kms_key_id`: The KMS key ID for encryption (if applicable). Example: `""`

### S3 Bucket Variables

- `s3_bucket_name`: The name of the S3 bucket. Example: `"unique-bucket-name-12345"`
- `s3_tags`: Tags to apply to the S3 bucket. Example:
  ```hcl
  s3_tags = {
    Name = "example-bucket"
  }
  ```
- `s3_acl`: The ACL to apply to the S3 bucket. Example: `"private"`
- `s3_versioning_status`: The versioning status of the S3 bucket. Example: `"Suspended"`
- `s3_sse_algorithm`: The server-side encryption algorithm to use. Example: `"AES256"`
- `s3_kms_master_key_id`: The KMS master key ID for SSE-KMS encryption. Example: `""`
- `create_bucket`: Whether to create the S3 bucket. Example: `true`

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
   # AWS Provider Variables
   aws_region  = "us-west-2"  # Replace with your preferred AWS region
   aws_profile = "default"    # Replace with your AWS CLI profile

   # VPC Variables
   vpc_cidr_block = "10.0.0.0/16"
   vpc_tags = {
   Name = "example-vpc"
   }

   # Subnet Variables
   subnet_cidr_block = "10.0.1.0/24"
   availability_zone = "us-west-2a"
   subnet_tags = {
   Name = "example-subnet"
   }

   # Security Group Variables
   security_group_name        = "example-sg"
   security_group_description = "Example security group"
   ingress_from_port          = 80
   ingress_to_port            = 80
   ingress_protocol           = "tcp"
   ingress_cidr_blocks        = ["0.0.0.0/0"]
   egress_from_port           = 0
   egress_to_port             = 0
   egress_protocol            = "-1"
   egress_cidr_blocks         = ["0.0.0.0/0"]
   security_group_tags = {
   Name = "example-sg"
   }

   # EC2 Instance Variables
   ami_id        = "ami-0abcdef1234567890"  # Replace with your preferred AMI ID
   instance_type = "t2.micro"
   compute_tags = {
   Name = "example-instance"
   }
   monitoring              = false
   disable_api_termination = false

   # EBS Volume Variables
   ebs_size = 20
   ebs_tags = {
   Name = "example-ebs"
   }
   ebs_volume_type = "gp2"
   ebs_encrypted   = false
   ebs_iops        = 100
   ebs_kms_key_id  = ""

   # S3 Bucket Variables
   s3_bucket_name = "example-bucket"
   s3_tags = {
   Name = "example-bucket"
   }
   s3_acl               = "private"
   s3_versioning_status = "Suspended"
   s3_sse_algorithm     = "AES256"
   s3_kms_master_key_id = ""
   create_bucket        = true
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

7. **Destroy the Infrastructure** (when no longer needed):

   ```bash
   terraform destroy
   ```

## Notes

- Ensure that the `s3_bucket_name` is unique across all AWS accounts.
- Adjust the variables in the `terraform.tfvars` file as needed to match your requirements.

By following these instructions, you should be able to set up and manage your AWS infrastructure using Terraform.
