# **HalcyonWorks - Ceyx Terraform Modules**

**Ceyx** is a cloud-agnostic Terraform module collection that simplifies the deployment of common infrastructure components across AWS, Azure, and GCP. The project aims to provide reusable and customizable modules for compute, network, and storage resources, supporting multi-cloud environments with a consistent interface.

## **Project Structure**

```
.
├── modules
│   ├── compute
│   │   ├── aws
│   │   │   ├── doc.md
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   ├── providers.tf
│   │   │   ├── variables.tf
│   │   │   └── versions.tf
│   │   ├── azure
│   │   │   ├── doc.md
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   ├── providers.tf
│   │   │   ├── variables.tf
│   │   │   └── versions.tf
│   │   └── gcp
│   │       ├── doc.md
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       ├── providers.tf
│   │       ├── variables.tf
│   │       └── versions.tf
│   ├── network
│   │   ├── aws
│   │   │   ├── doc.md
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   ├── providers.tf
│   │   │   ├── variables.tf
│   │   │   └── versions.tf
│   │   ├── azure
│   │   │   ├── doc.md
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   ├── providers.tf
│   │   │   ├── variables.tf
│   │   │   └── versions.tf
│   │   └── gcp
│   │       ├── doc.md
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       ├── providers.tf
│   │       ├── variables.tf
│   │       └── versions.tf
│   └── storage
│       ├── aws
│       │   ├── doc.md
│       │   ├── main.tf
│       │   ├── outputs.tf
│       │   ├── providers.tf
│       │   ├── variables.tf
│       │   └── versions.tf
│       ├── azure
│       │   ├── doc.md
│       │   ├── main.tf
│       │   ├── outputs.tf
│       │   ├── providers.tf
│       │   ├── variables.tf
│       │   └── versions.tf
│       └── gcp
│           ├── doc.md
│           ├── main.tf
│           ├── outputs.tf
│           ├── providers.tf
│           ├── variables.tf
│           └── versions.tf
└── src
    ├── aws
    │   ├── README.md
    │   ├── main.tf
    │   ├── outputs.tf
    │   ├── terraform.tfvars.template
    │   └── variables.tf
    ├── azure
    │   ├── README.md
    │   ├── main.tf
    │   ├── outputs.tf
    │   ├── terraform.tfvars.template
    │   └── variables.tf
    └── gcp
        ├── README.md
        ├── main.tf
        ├── outputs.tf
        ├── terraform.tfvars.template
        └── variables.tf

```

## **Modules Overview**

### **Compute Modules**

- **AWS**: Provisions EC2 instances with customizable instance type, AMI, and network configurations.
- **Azure**: Deploys Virtual Machines with support for different sizes and disk configurations.
- **GCP**: Manages Compute Engine instances with options for machine types and networks.

### **Network Modules**

- **AWS**: Creates VPCs, subnets, and route tables.
- **Azure**: Deploys Virtual Networks and subnets.
- **GCP**: Provisions VPC networks and subnets.

### **Storage Modules**

- **AWS**: Manages S3 buckets with versioning and lifecycle configurations.
- **Azure**: Creates Storage Accounts and Blob containers.
- **GCP**: Configures Cloud Storage buckets with uniform access control.

## **Getting Started**

### **Prerequisites**

- [Terraform](https://www.terraform.io/downloads.html) v1.0.0 or later.
- Cloud provider accounts and appropriate credentials configured for AWS, Azure, and GCP.
- [terraform-docs](https://terraform-docs.io/) for generating module documentation (optional).

### **Setup**

1. Clone the repository:

   ```bash
   git clone https://github.com/HalcyonWorks/Ceyx.git
   cd Ceyx
   ```

2. Initialize the Terraform configuration:

   ```bash
   terraform init
   ```

3. Review and edit the example configurations in the `src` directory for your chosen provider (AWS, Azure, GCP).

4. Apply the configuration:
   ```bash
   terraform apply
   ```

### **Using Modules**

Each module can be used independently by specifying the module source path and providing the required variables.

#### **Example: Using the AWS Compute Module**

```hcl
module "aws_compute" {
  source = "../modules/compute/aws"

  name          = "example-instance"
  region        = "us-east-1"
  instance_type = "t2.micro"
  ami_id        = "ami-0c55b159cbfafe1f0"
  tags          = {
    Environment = "Development"
  }
}
```

### **Documentation**

You can generate the latest documentation for each module using `terraform-docs`. Run the following script:

```bash
./generate-docs.sh
```

## **Contributing**

Contributions are welcome! Please follow these guidelines:

1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Submit a pull request with a detailed description of your changes.

## **License**

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
