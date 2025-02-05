module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  environment        = var.environment
}

module "eks" {
  source            = "../../modules/eks"
  
  cluster_name      =  "${var.cluster_name}-${var.environment}"
  cluster_role_arn  = "arn:aws:iam::084375582994:role/EKSClusterRole"
  cluster_version   = var.cluster_version
  subnet_ids        = module.vpc.private_subnets  # EKS workers in private subnets

  # Define multiple node groups
  node_groups = [
    {
      name            = "on-demand-nodes"
      node_role_arn   = "arn:aws:iam::084375582994:role/EKSNodeRole"
      
      instance_types  = ["t3.medium"]
      capacity_type   = "ON_DEMAND"
      desired_size    = 1
      min_size        = 1
      max_size        = 3
    },
    {
      name            = "spot-nodes"
      node_role_arn   = "arn:aws:iam::084375582994:role/EKSNodeRole"
      instance_types  = ["t3.large", "m5.large", "c5.large"]  # Multiple types to increase availability
      capacity_type   = "SPOT"  # Enables Spot Instances
      desired_size    = 2
      min_size        = 1
      max_size        = 3
    }
  ]
}


