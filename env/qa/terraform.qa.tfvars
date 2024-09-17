# AWS Region
region = "us-west-2"
account_id = "050752621859"
# EKS Cluster Configuration
cluster_name      = "qa-eks-cluster"
vpc_name = "nonprod-vpc"

cluster_version = "1.29"

cidr_range = "10.0.0.0/16"

private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

# MongoDB Configuration
mongodb_namespace = "qa-mongodb"
mongodb_replicas  = 3

# ECR Repository Name
ecr_name          = "hw-nodejs"

# ALB
eks_lb_name = "qa_eks_lb"

# Additional Tags for ECR
additional_tags = {
  Owner       = "DevOps team"
  Environment = "QA"
}
