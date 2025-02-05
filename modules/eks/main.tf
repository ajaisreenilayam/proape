resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  version = var.cluster_version  # Ensure this is included
}

resource "aws_eks_node_group" "eks_nodes" {
  for_each = { for ng in var.node_groups : ng.name => ng }

  cluster_name    = aws_eks_cluster.this.name  # This was missing before
  node_group_name = each.value.name
  node_role_arn   = each.value.node_role_arn
  subnet_ids      = var.subnet_ids
  instance_types  = each.value.instance_types
  capacity_type   = each.value.capacity_type

  scaling_config {
    desired_size = each.value.desired_size
    min_size     = each.value.min_size
    max_size     = each.value.max_size
  }

  labels = {
    name      = each.value.name
    lifecycle = each.value.capacity_type
  }
}
