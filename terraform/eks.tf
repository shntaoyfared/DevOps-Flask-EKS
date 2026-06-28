provider "aws" {
  region = "us-east-1" # AWS region where all resources will be created
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws" # Official EKS module from the Terraform Registry
  version = "~> 20.0"                       # Use version 20.x of the module

  # ==========================
  # EKS Cluster Configuration
  # ==========================

  cluster_name    = "flask-eks" # Name of the EKS cluster
  cluster_version = "1.34"      # Kubernetes version running on the cluster

  enable_irsa = true

  # Grant your IAM user full administrator access to the cluster
  access_entries = {
    admin = {
      principal_arn = "arn:aws:iam::777197354812:user/shntaoy.fared"

      policy_associations = {
        admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }

  # ==========================
  # Networking
  # ==========================

  vpc_id = aws_vpc.example.id # Attach the EKS cluster to the VPC created in vpc.tf

  subnet_ids = [
    aws_subnet.public_subnet.id, # Public subnet used by the cluster
    aws_subnet.private_subnet.id # Private subnet used by the cluster
  ]

  cluster_endpoint_public_access  = true # Allow kubectl access from outside the VPC
  cluster_endpoint_private_access = true # Also allow access from inside the VPC

  # ==========================
  # EKS Managed Node Groups
  # ==========================

  eks_managed_node_groups = {

    # --------------------------
    # Public Node Group
    # --------------------------

    public_nodes = {
      subnet_ids = [
        aws_subnet.public_subnet.id # Launch these worker nodes in the public subnet
      ]

      desired_size = 1
      min_size     = 1
      max_size     = 2

      instance_types = ["t3.micro"]
    }

    # --------------------------
    # Private Node Group
    # --------------------------

    private_nodes = {
      subnet_ids = [
        aws_subnet.private_subnet.id # Launch these worker nodes in the private subnet
      ]

      desired_size = 1
      min_size     = 1
      max_size     = 2

      instance_types = ["t3.micro"]
    }
  }

  # ==========================
  # Resource Tags
  # ==========================

  tags = {
    Project     = "Flask DevOps Project"
    Environment = "Dev"
  }
}
