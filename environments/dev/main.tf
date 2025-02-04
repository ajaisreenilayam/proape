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

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets

  # Managed Node Groups
  managed_node_groups = {
    on_demand = {
      desired_capacity = var.on_demand_desired_capacity
      max_capacity     = var.on_demand_max_capacity
      min_capacity     = var.on_demand_min_capacity
      instance_types   = var.on_demand_instance_types
      capacity_type    = "ON_DEMAND"
    }
    spot = {
      desired_capacity = var.spot_desired_capacity
      max_capacity     = var.spot_max_capacity
      min_capacity     = var.spot_min_capacity
      instance_types   = var.spot_instance_types
      capacity_type    = "SPOT"
    }
  }

  tags = var.tags
}

