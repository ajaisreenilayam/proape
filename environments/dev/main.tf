module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  environment        = var.environment
}

module "eks" {
  source = "../../modules/eks"

  cluster_name      = "example-cluster"
  cluster_role_arn = "arn:aws:iam::084375582994:role/EKSClusterRole" 
  node_group_name   = "example-node-group"
  node_role_arn     = "arn:aws:iam::123456789012:role/EKSNodeRole"     # Replace with your actual role ARN
  subnet_ids        = module.vpc.private_subnets  # EKS workers in private subnets
  cluster_version   = "1.30"
  node_desired_count = 2
  node_min_count    = 1
  node_max_count    = 3

  # Optional: if your EKS module differentiates between public and private subnets:
  public_subnets  = module.vpc.public_subnets  # For public resources
  private_subnets = module.vpc.private_subnets # For private worker nodes
}


