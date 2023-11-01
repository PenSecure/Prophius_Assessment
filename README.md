# Prophius_Assessment

Infrastructure Setup Documentation for EKS Cluster, ECR, and RDS MySQL using Terraform

Preparation Steps:

1. Prerequisites:
   - Ensure you have an active AWS account with necessary permissions.
   - GitHub account for version control.
   - Install Terraform on your local machine.
   - (Optional) Set up AWS CodePipeline for automated deployment.

2. AWS Credentials:
   - Configure AWS credentials using environment variables or IAM roles for EC2 instances.

Infrastructure Setup Steps:

3. Configure AWS Provider:
   - Set up authentication with your AWS account.
   - Create a file named `provider.tf` with appropriate AWS credentials.

   [Example Code: provider.tf](https://github.com/PenSecure/Prophius_Assessment/blob/main/provider.tf)

4. Network Infrastructure Setup (VPC, Subnets):
   - Define VPC, private and public subnets.
   - Create `vpc.tf` file to configure networking resources.

   [Example Code: vpc.tf](https://github.com/PenSecure/Prophius_Assessment/blob/main/vpc.tf)

5. Private ECR Setup:
   - Create a private Elastic Container Registry (ECR) repository.
   - Set policies to deny public access.
   - Use `ecr.tf` for ECR setup.

   [Example Code: ecr.tf](https://github.com/PenSecure/Prophius_Assessment/blob/main/ecr.tf)

6. MySQL Setup (Multi-AZ Deployment):
   - Launch a private RDS MySQL instance in Multi-AZ architecture.
   - Configure security group rules.
   - Use `mysql.tf` for RDS setup.

   [Example Code: mysql.tf](https://github.com/PenSecure/Prophius_Assessment/blob/main/mysql.tf)

7. EKS Cluster Setup:
   - Create an EKS cluster with necessary configurations.
   - Ensure private worker nodes and public subnets for external access.
   - Utilize `eks.tf` for EKS cluster setup.

   [Example Code: eks.tf](https://github.com/PenSecure/Prophius_Assessment/blob/main/eks.tf)

8. Terraform Variables:
   - Define input variables for AWS resources in `vars.tf`.

   [Example Code: vars.tf](https://github.com/PenSecure/Prophius_Assessment/blob/main/vars.tf)

9. Terraform Configuration File:
   - Create `terraform.tfvars` to assign values to variables.

   [Example Code: terraform.tfvars](https://github.com/PenSecure/Prophius_Assessment/blob/main/terraform.tfvars)

10. Outputs Configuration:
    - Define outputs for retrieved information post-deployment in `output.tf`.

    [Example Code: output.tf](https://github.com/PenSecure/Prophius_Assessment/blob/main/output.tf)

11. Infrastructure Deployment:
    - Clone the GitHub repository. "https://github.com/PenSecure/Prophius_Assessment.git"
    - Initialize Terraform: $ terraform init.
    - Apply changes: $ terraform apply -auto-approve.

13. (Optional) Automated Deployment using AWS CodePipeline:
    - Set up S3 bucket for CodePipeline artifacts.
    - Create an IAM role for CodePipeline.
    - Uncomment “terraform-buildspec.yml” in the source code.
    - Configure AWS CodePipeline stages (Source, Build).

13. Connecting to EKS Cluster:
    - Update Kubernetes context: `$ aws eks update-kubeconfig --name eks-terraform-project --region us-east-1`.
    - Verify access: `$ kubectl get nodes`.
