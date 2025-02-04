module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "18.29.0"  # Ensure this is the latest version
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = var.vpc_id
  subnet_ids      = var.subnet_ids

  # Managed Node Groups
  managed_node_groups = {
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
