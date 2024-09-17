# AWS Region
region = "us-west-2"

# EKS Cluster Configuration
cluster_name      = "dev-eks-cluster"
vpc_name = "nonprod-vpc"

cluster_version = "1.29"

cidr_range = "10.0.0.0/16"

private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

# MongoDB Configuration
mongodb_namespace = "dev-mongodb"
mongodb_replicas  = 3

# ECR Repository Name
ecr_name          = "hw-nodejs"

# ALB
eks_lb_name = "dev_eks_lb"

# Additional Tags for ECR
additional_tags = {
  Owner       = "DevOps team"
  Environment = "dev"
}
